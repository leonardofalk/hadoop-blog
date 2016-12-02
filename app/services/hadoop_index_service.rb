class HadoopIndexService
  attr_reader :model, :fields

  def initialize(model)
    @model = model

    @fields = @model.class.columns.map do |column|
      { name: column.name.to_sym, type: column.type } if [:string, :text].include?(column.type)
    end.compact
  end

  def resolve
    generate_indexes
    count_indexes
    consume_indexes
  ensure
    # assegurar que o diretorio que o hadoop cria sempre e deletado
    # porque na proxima chamada o hadoop nao reescreve o diretorio
    clean_directory
  end

  def count_indexes
    Dir.foreach(Rails.root.join('index_instances')) do |file|
      unless file.starts_with? '.'
        ok = word_count_file(file)

        raise "Erro ocorreu durante a execução do hadoop word_count.jar (arquivo: #{file})" unless ok
      end
    end
  end

  def consume_indexes
    Dir.foreach(Rails.root.join('hadoop_result')) do |file|
      unless file.starts_with? '.'
        _, id = file.scan(/(.+)\_(\d+)$/i).first
        content = File.open("hadoop_result/#{file}/part-r-00000").read

        content.scan(/^(.+)\s+(\d+)$/i).each do |entry|
          word, count = entry
          word = word.delete('.').strip.downcase
          count = count.to_i
          word_count = WordRank.find_by(word: word, post_id: id)

          if word_count
            word_count.rank = word_count.rank + count
            word_count.save
          else
            WordRank.create(word: word, post_id: id, rank: count)
          end
        end
      end
    end
  end

  def clean_directory
    FileUtils.rm_rf Rails.root.join('hadoop_result')
  end

  private

  def word_count_file(file_name)
    command = "hadoop jar build/word_count.jar wordcount index_instances/#{file_name} hadoop_result/#{file_name[0..-5]}"

    ok = system(command)

    FileUtils.rm_rf(Rails.root.join('index_instances', file_name)) if ok

    ok
  end

  def generate_indexes
    instance_path = "#{model.class.to_s.underscore}_#{model.id}.txt"
    file_path     = Rails.root.join('index_instances', instance_path)
    fl            = File.open(file_path, 'w')

    fields.each do |attribute|
      fl.write("#{model.send(attribute[:name].to_sym)}\n")
      fl.flush
    end
  rescue
    puts "Erro ao escrever arquivo (#{file_path})"
  ensure
    fl.close unless fl.nil?
  end
end

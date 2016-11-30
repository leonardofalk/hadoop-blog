require 'rubydoop'

class HadoopIndexService
  attr_reader :klass, :fields

  def initialize(klass)
    @klass = klass.class
    @fields = @klass.columns.map do |column|
      { name: column.name.to_sym, type: column.type } if [:string, :text].include?(column.type)
    end.compact
  end

  def resolve
    generate_indexes
  end

  private

  def generate_indexes
    klass.all.each do |instance|
      begin
        instance_path = "#{klass.to_s.underscore}_#{instance.id}.txt"
        file_path     = Rails.root.join('index_instances', instance_path)
        fl            = File.open(file_path, 'w')

        fields.each do |attribute|
          fl.write("#{instance[attribute[:name].to_sym]}\n")
          fl.flush
        end
      rescue
        puts "Erro ao escrever arquivo : #{file_path}"
      ensure
        fl.close unless fl.nil?
      end
    end
  end
end

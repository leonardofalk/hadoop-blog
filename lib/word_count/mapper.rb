class WordCount::Mapper
  def map(key, value, context)
    value.to_s.split.each do |word|
      word.gsub!(/\W/, '')
      word.downcase!

      unless word.empty?
        context.write(Hadoop::Io::Text.new(word), Hadoop::Io::IntWritable.new(1))
      end
    end
  end
end

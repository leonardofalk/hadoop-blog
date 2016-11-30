class WordCount::Reducer
  def reduce(key, values, context)
    sum = 0
    values.each { |value| sum += value.get }
    context.write(key, Hadoop::Io::IntWritable.new(sum))
  end
end

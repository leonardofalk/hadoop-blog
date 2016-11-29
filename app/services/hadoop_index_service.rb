class HadoopIndexService
  def initialize(model)
    @class = model.class
    @fields = @class.columns.map do |column|
      {name: column.name.to_sym, type: column.type }
    end
  end
end

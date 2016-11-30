class IndexerJob < ApplicationJob
  queue_as :default

  def perform(*args)
    index_service = HadoopIndexService.new(args.first) if args.size > 0

    index_service.resolve
  end
end

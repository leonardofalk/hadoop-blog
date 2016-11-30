class Post < ApplicationRecord
  belongs_to :author

  after_save :perform_job

  def perform_job
    IndexerJob.perform_later(self)
  end
end

class Post < ApplicationRecord
  belongs_to :author
  has_many :word_ranks

  after_save :perform_word_count

  private

  def perform_word_count
    IndexerJob.perform_later(self)
  end
end

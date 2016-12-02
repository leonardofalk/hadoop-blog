class Post < ApplicationRecord
  belongs_to :author
  has_many :word_ranks

  after_save :perform_word_count

  private

  def perform_word_count
    IndexerJob.perform_later(self)
  end

  def ransackable_scopes(auth_object = nil)
    [:word_cont, :content_cont]
  end
end

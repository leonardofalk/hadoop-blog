class WordRank < ActiveRecord::Base
  belongs_to :post

  default_scope {
    order(rank: :desc)
  }
  
  def ransackable_scopes(auth_object = nil)
    [:word_cont, :content_cont]
  end
end

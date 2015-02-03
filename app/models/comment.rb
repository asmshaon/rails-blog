class Comment < ActiveRecord::Base
  has_paper_trail

  belongs_to :post

  validates :commenter, presence: true, length: { minimum: 5, maximum: 26 }
  validates :body, presence: true, length: { minimum: 10, maximum: 1000 }
end

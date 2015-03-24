class Post < ActiveRecord::Base

  has_paper_trail

  validates :title, presence: true, length: {minimum: 5, maximum: 250}
  validates :body, presence: true, length: {minimum: 10, maximum: 1000}
  validates :author, presence: true, length: {minimum: 4, maximum: 26}

  has_many :comments, dependent: :destroy

  scope :by_recent_order, -> { order 'created_at DESC' }
  scope :by_old_order, -> { order 'created_at ASC' }

  include Tire::Model::Search
  include Tire::Model::Callbacks

  mapping do
    indexes :id, :index => :not_analyzed
    indexes :title
    indexes :body
  end

  before_destroy do
    Post.tire.index.remove self
  end

end

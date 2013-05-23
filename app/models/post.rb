class Post < ActiveRecord::Base
  validates :title, presence: true

  has_many :post_votes
  has_many :comments
  belongs_to :user
end

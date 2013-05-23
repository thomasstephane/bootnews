class Comment < ActiveRecord::Base
  validates :comment, presence: true

  has_many :comment_votes
  belongs_to :post
  belongs_to :user
end

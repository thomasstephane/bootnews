class Comment < ActiveRecord::Base
  validates :comment, presence: true

  belongs_to :post
  belongs_to :user
end

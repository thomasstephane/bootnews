class CommentVote < ActiveRecord::Base
  validates :user_id, :comment_id, :vote, presence: true

  belongs_to :comment
  belongs_to :user
end

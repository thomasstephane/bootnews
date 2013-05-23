class Comment < ActiveRecord::Base
  validates :comment, presence: true

  has_many :comment_votes
  belongs_to :post
  belongs_to :user

  def score
    CommentVote.where("comment_id = ?", self.id).sum('vote').to_s
  end
  
  def user_name
    User.find(self.user_id).name
  end
  
  def user_email
    User.find(self.user_id).email
  end
end

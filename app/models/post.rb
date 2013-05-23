class Post < ActiveRecord::Base
  validates :title, presence: true

  has_many :post_votes
  has_many :comments
  belongs_to :user

  def score
    PostVote.where("post_id = ?", self.id).sum('vote').to_s
  end

  def user_name
    User.find(self.user_id).name
  end

  def user_email
    User.find(self.user_id).email
  end
end

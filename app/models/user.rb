class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :username, uniqueness:true, presence: true

  has_many :posts
  has_many :comments
  has_many :post_votes
  has_many :comment_votes

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def total_votes
    PostVote.where("user_id = ?",self.id).count + CommentVote.where("user_id = ?",self.id).count 
  end

  def total_posts
    Post.where("user_id = ?",self.id).count
  end

  def total_comments
    Comment.where("user_id = ?",self.id).count 
  end

end

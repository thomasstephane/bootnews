class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :username, uniqueness:true, presence: true

  has_many :posts
  has_many :comments

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

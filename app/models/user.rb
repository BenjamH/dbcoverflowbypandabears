class User < ActiveRecord::Base
  include BCrypt
  has_many :questions
  has_many :answers

  validates :email, :hashed_password, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(given_password)
  	self.password == given_password
  end

end

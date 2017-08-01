class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  has_secure_password

  validates :username, uniqueness: true
  validates :username, :password, presence: true

end

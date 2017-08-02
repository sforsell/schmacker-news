class Post < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, :body, :user, presence: true
end

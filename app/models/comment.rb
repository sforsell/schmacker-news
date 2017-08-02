class Comment < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :post

  validates :text, :user, :post, presence: true

end

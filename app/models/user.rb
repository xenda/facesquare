class User < ActiveRecord::Base
  attr_accessible :email, :name

  scope :dead, where(created_at: 10.days.ago)
  scope :active, where(created_at: 10.days.ago)
  has_many :posts

end

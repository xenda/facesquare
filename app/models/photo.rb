# ActiveModel 

class Photo < ActiveRecord::Base
  attr_accessible :content, :user_id

  has_many :photo_posts
  has_many :posts, through: :photo_posts

  def name
    content
  end

end

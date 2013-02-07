class Post < ActiveRecord::Base
  attr_accessible :content, :kind, :published_at, :title, :photo_ids

  belongs_to :user
  has_many :photo_posts
  has_many :photos, through: :photo_posts

end

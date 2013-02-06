class Post < ActiveRecord::Base
  attr_accessible :content, :kind, :published_at, :title
end

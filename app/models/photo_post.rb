class PhotoPost < ActiveRecord::Base
  attr_accessible :photo_id, :post_id

  belongs_to :post
  belongs_to :photo
end

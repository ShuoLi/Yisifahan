class Image < ActiveRecord::Base
  belongs_to :item
  attr_accessible :image
  mount_uploader :image, ImageUploader
end

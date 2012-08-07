class Slide < ActiveRecord::Base
  has_one :item
  attr_accessible :image, :item_id
  mount_uploader :image, ImageUploader
  validates_presence_of :image
end

class Slide < ActiveRecord::Base
  belongs_to :item
  attr_accessible :item_id, :image
  mount_uploader :image, ImageUploader
  validates_presence_of :image
end

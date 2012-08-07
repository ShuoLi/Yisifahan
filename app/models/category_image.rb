class CategoryImage < ActiveRecord::Base
  belongs_to :category
  attr_accessible :category_id, :image 
  mount_uploader :image, ImageUploader
  validates_presence_of :image
end
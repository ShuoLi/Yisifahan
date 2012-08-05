class CategoryImage < ActiveRecord::Base
  belongs_to :category
  attr_accessible :category_id, :image 
  mount_uploader :image, ImageUploader
end
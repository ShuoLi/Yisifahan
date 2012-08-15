class Category < ActiveRecord::Base
  has_many :items
  attr_accessible :name, :image 
  validates_presence_of :name
  mount_uploader :image, ImageUploader
end

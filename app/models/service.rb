class Service < ActiveRecord::Base
  attr_accessible :image,:title,:content
  mount_uploader :image, ImageUploader
  validates_presence_of :title, :content
end

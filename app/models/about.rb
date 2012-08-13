class About < ActiveRecord::Base
  attr_accessible :image,:title,:content
  validates_presence_of :title, :content, :image
  mount_uploader :image, ImageUploader
end

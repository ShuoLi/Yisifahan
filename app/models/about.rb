class About < ActiveRecord::Base
  attr_accessible :image,:title,:content
  validates_presence_of :title, :content
  mount_uploader :image, ImageUploader
end

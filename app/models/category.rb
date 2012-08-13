class Category < ActiveRecord::Base
  has_many :items
  has_one :category_image, :dependent => :destroy
  validates_presence_of :name
end

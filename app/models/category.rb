class Category < ActiveRecord::Base
  has_many :items
  has_one :category_image
end

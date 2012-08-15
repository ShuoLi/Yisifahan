class Item < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  has_many :slides, :dependent => :destroy
  belongs_to :category
  attr_accessible :category_id, :name, :popular, :price, :description, :item_code
  validates :price, :presence => true
  validates :name, :presence => true
  validates :item_code, :presence => true, :uniqueness => true

  #the self search code is for building the search list
  def self.search(query)
    if query
      result = where('name LIKE ?', "%#{query}%")
      # find by item_code
      item = find_by_item_code(query)
      result << item if item
    else
      result = find(:all)
    end
    return result
  end
  
  def self.filter(low, high)
    low = low.to_i if low
    high = high.to_i if high
    items = []
    if low && high
      Item.all.each do |i|
        if i.price >= low && i.price <= high
          items << i
        end
      end
    elsif low && !high
      Item.all.each do |i|
        if i.price >= low
          items << i
        end
      end
    elsif high && !low
      Item.all.each do |i|
        if i.price <= high
          items << i
        end
      end
    else
      items = Item.all
    end
    return items
  end
  
  def self.categoryfilter(category)
    items = []
    if category == "-1"
      Item.all.each do |i|
        if i.category_id.nil?
          items << i
        end
      end
    else
     items = Category.find(category).items.all
    end
    return items
  end
  
  def self.sortbyprice(parameters)
    items = self.search(parameters["search_text"])
    parameters.each do |p|
      key = p.first 
      value = p[1]
      case key
      when "cpath"
        items = items.find_all{|i| i.category_id == value}
      when "low"
        items = items.find_all{|i| i.price >= value.to_i}
      when "high"
        items = items.find_all{|i| i.price <= value.to_i}
      when "ascend"
        (value == "true") ? (items = items.sort{|a,b| a.price <=> b.price}) : (items = items.sort{|a,b| b.price <=> a.price})
      when "search_text"
      end
    end
    return items
  end
end

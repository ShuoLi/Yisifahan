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
  	condition = ""
  	if low != "" and low
  		condition += ' price >= ' + low
  	end
  		
  	if high != "" and high
  		if condition != ""
  			condition += ' AND '
  		end
  		condition += ' price <= ' + high
  	end
  	where(condition).order('price ASC')
  end
  
  def self.categoryfilter(category)
   	if category == "-1"
  		where('category_id IS null')
	else
 		where(category_id: category)
  	end
  end
  
  def self.sortbyprice(parameters)
  	condition = ""
  	if parameters["cpath"]
  		if condition != ""
  			condtion += ' AND '
  		end
  		if parameters["cpath"] == "-1"
  			condition += "category_id IS null"
  		else
  			condition += "category_id IS " + parameters["cpath"]
  		end
  	end
  	
  	if parameters["low"] != "" and parameters["low"]
  		if condition != ""
  			condition += ' AND '
  		end
   		condition += ' price >= ' + parameters["low"]
  	end
  		
  	if parameters["high"] != "" and parameters["high"]
  		if condition != ""
  			condition += ' AND '
  		end
  		condition += ' price <= ' + parameters["high"]
  	end
  	
  	order = ""
  	if parameters["ascend"] == "true"
  		order +='price ASC'
  	else
  		order +='price DESC'
  	end
  	
  	if parameters["search_text"]
  		where('name LIKE ?', "%#{parameters["search_text"]}%").where(condition).order(order)
  	else
  		where(condition).order(order)
  	end
  end
end

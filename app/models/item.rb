class Item < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  belongs_to :category
  attr_accessible :category_id, :name, :popular, :price, :description
  validates :price, :presence => true
  validates :name, :presence => true

  #the self search code is for building the search list
  def self.search(query)
    if query
      find(:all ,:conditions=>['name LIKE ?', "%#{query}%"])
    else
      find(:all)
    end
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
  	find(:all, :conditions=>[condition], :order=>'price ASC')
  end
  
  def self.categoryfilter(category)
   	if category == "-1"
  		find(:all, :conditions=>['category_id IS null'])
	else
 		find(:all, :conditions=>['category_id IS ?', category])
  	end
  end
  
  def self.sortbyprice(parameters)
  	condition = ""
  	if parameters["cpath"]
  		if condition != ""
  			condtion += ' AND '
  		end
  		condition += "category_id IS " + parameters["cpath"]
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
  		where('name LIKE ?', "%#{parameters["search_text"]}%").find(:all, :conditions=>condition, :order=>order)
  	else
  		find(:all, :conditions=>condition, :order=>order)
  	end
  end
end

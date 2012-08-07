class Item < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  belongs_to :category
  attr_accessible :category_id, :name, :popular, :price, :description
  
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
  	find(:all, :conditions=>[condition])
  end
  
  def self.categoryfilter(category)
  	find(:all, :conditions=>['category_id IS ?', category])
  	
  end
  
  def self.uncategorized()
  	find(:all, :conditions=>['category_id IS null'])
  	
  end
end

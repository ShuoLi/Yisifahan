class Item < ActiveRecord::Base
  has_many :images, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true
  has_many :slides, :dependent => :destroy
  belongs_to :category
  attr_accessible :category_id, :name, :popular, :price, :description, :item_code
  validates :price, :presence => true
  validates :name, :presence => true
  validates :item_code, :presence => true, :uniqueness => true
  
  def self.findItems(parameters)
  	condition = ""
  	order = ""
  	parameters.each do |p|
  		case p.first
  			when "ascend"
  				if p[1] == "0"
  					order += 'created_at ASC'
  				elsif p[1] == "1"
			  		order += 'created_at DESC'
		  		elsif p[1] == "2"
		  			order +='price ASC'
		  		else
			  		order +='price DESC'
			  	end
  			when "low"
  				condition += self.addAND(condition)
  				condition += ' price >= ' + p[1]
  			when "high"
  				condition += self.addAND(condition)
  				condition += ' price <= ' + p[1]  				
  			when "cpath"
  				condition += self.addAND(condition)
  				if p[1] == "-1"
		  			condition += "category_id IS null"
		  		else
		  			condition += "category_id = " + p[1]
		  		end    			
  		end
  	end
  	
   	if parameters["search_text"]
  		where('name LIKE ?', "%#{parameters["search_text"]}%").where(condition).order(order)
  	else
  		where(condition).order(order)
  	end 	
  end
  
  def self.addAND(condition)
  	if condition != ""
  		' AND '
  	else
  		""
  	end
  end
end

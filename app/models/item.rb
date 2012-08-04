class Item < ActiveRecord::Base
  has_many :images
  
  #the self search code is for building the search list
  def self.search(query)
    if query
      find(:all ,:conditions=>['name LIKE ?', "%#{query}%"])
    else
      find(:all)
    end
  end
  
end

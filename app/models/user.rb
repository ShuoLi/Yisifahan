class User < ActiveRecord::Base
  validates :name,
            :presence => true,
            :format => { :with => /\A[a-z0-9\-]+\z/i },
            :uniqueness => true,
            :length => 3..20
  
  validates :password,
            :presence => true,
            :confirmation => true,
            :length => 6..20
end

class Message < ActiveRecord::Base
    attr_accessible :name, :email, :content
    validates_presence_of :email, :phone
end

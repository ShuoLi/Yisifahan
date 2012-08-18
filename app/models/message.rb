class Message < ActiveRecord::Base
    attr_accessible :name, :email, :content
    validate_presence_of :email, :phone
end

class User < ActiveRecord::Base 
  validates_presence_of :first_name, :last_name, :email, :username
end
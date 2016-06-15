class Company < ActiveRecord::Base 
 validates :name, :address, :city, presence: true
 has_many :users 
 has_many :jobs 
end
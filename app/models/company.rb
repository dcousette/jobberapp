class Company < ActiveRecord::Base 
 validates :name, :address, :city, presence: true
 validates :name, uniqueness: true
 has_many :users 
end
class User < ActiveRecord::Base 
  validates :first_name, :last_name, :username, :email, presence: true 
  validates :employer, exclusion: { in: [nil] }
  has_secure_password validations: false 
  belongs_to :company
  has_many :jobs 
end
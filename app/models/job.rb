class Job < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  has_many :applications
  validates :title, :description, :requirements, :salary, :company_id, :user_id, presence: true
end

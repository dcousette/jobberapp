class Application < ActiveRecord::Base
  validates_presence_of :interest_reason, :availability
end 
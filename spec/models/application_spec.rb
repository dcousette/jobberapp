require 'rails_helper'

describe Application do 
  it { should validate_presence_of :interest_reason }
  it { should validate_presence_of :availability }
end 
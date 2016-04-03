require 'rails_helper'

describe User do
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_exclusion_of(:employer).in_array([nil]) }
end 
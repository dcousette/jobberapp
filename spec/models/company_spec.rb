require 'rails_helper'

describe Company do 
  it { should validate_presence_of(:name) } 
  it { should validate_uniqueness_of(:name) } 
  it { should validate_presence_of(:address) } 
  it { should validate_presence_of(:city) } 
end
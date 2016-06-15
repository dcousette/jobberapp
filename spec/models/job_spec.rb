require 'rails_helper'

describe Job do
  it { should belong_to(:company) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:requirements) }
  it { should validate_presence_of(:salary) }
end 
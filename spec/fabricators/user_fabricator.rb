Fabricator(:user) do 
  first_name { Faker::Name.first_name }
  last_name  { Faker::Name.last_name }
  email      { Faker::Internet.free_email }
  employer   { Faker::Boolean.boolean }
  username { Faker::Internet.user_name }
  password { Faker::Internet.password }
end
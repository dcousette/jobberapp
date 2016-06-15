Fabricator(:job) do
  user 
  title { Faker::Company.profession }
  company
  description { Faker::Lorem.paragraph(3) }
  requirements { Faker::Lorem.paragraph(3) }
  salary { Faker::Number.number(5) }
end 
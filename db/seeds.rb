# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

google = Company.create(name: 'Google', address: '1 Google Way', city: 'San Francisco',
                        state: 'CA', zip: '90910')

john   = User.create(username: 'jstuart', first_name: 'John', last_name: 'Stuart',
                     email: 'jstuart@gmail.com', employer: true, password: 'jstuart',
                     company: google)

manager = Job.create(company: google,
                     title: 'Manager',
                     requirements: 'Be smart. Work hard. Be awesome!',
                     description: 'Manage a team, Drive em hard, Get results!',
                     salary: 90000,
                     user: john)

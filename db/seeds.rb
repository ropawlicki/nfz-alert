# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User seed

(1..20).each do |n|
  user = User.new(email: "user#{n}@example.com", password: "123456")
  user.skip_confirmation!
  user.save!
end

(1..3).each do |n|
  user = User.new(email: "admin#{n}@example.com", password: "123456", admin: true)
  user.skip_confirmation!
  user.confirm!
  user.save!
end

# Query seed

Query.create(id: 1, case: 1, province: "07", locality: "warszawa", benefit: "alergolog")
Query.create(id: 2, case: 2, province: "01", locality: "wrocław", benefit: "kardiolog")
Query.create(id: 3, case: 1, province: "06", locality: "kraków", benefit: "endokrynolog")
Query.create(id: 4, case: 1, province: "12", locality: "katowice", benefit: "alergolog")
Query.create(id: 5, case: 1, province: "07", locality: "warszawa", benefit: "alergolog")

# UserQuery seed

UserQuery.create(user_id: 1 , query_id: 1)
UserQuery.create(user_id: 1 , query_id: 2)
UserQuery.create(user_id: 2 , query_id: 2)
UserQuery.create(user_id: 2 , query_id: 3)
UserQuery.create(user_id: 3 , query_id: 1)
UserQuery.create(user_id: 3 , query_id: 2)

# Province codes for API queries

ProvinceCode.create(name: 'dolnośląskie', code: '01')
ProvinceCode.create(name: 'kujawsko-pomorskie', code: '02')
ProvinceCode.create(name: 'lubelskie', code: '03')
ProvinceCode.create(name: 'lubuskie', code: '04')
ProvinceCode.create(name: 'łódzkie', code: '05')
ProvinceCode.create(name: 'małopolskie', code: '06')
ProvinceCode.create(name: 'mazowieckie', code: '07')
ProvinceCode.create(name: 'opolskie', code: '08')
ProvinceCode.create(name: 'podkarpackie', code: '09')
ProvinceCode.create(name: 'podlaskie', code: '10')
ProvinceCode.create(name: 'pomorskie', code: '11')
ProvinceCode.create(name: 'śląskie', code: '12')
ProvinceCode.create(name: 'świętokrzyskie', code: '13')
ProvinceCode.create(name: 'warmińsko-mazurskie', code: '14')
ProvinceCode.create(name: 'wielkopolskie', code: '15')
ProvinceCode.create(name: 'zachodnio-pomorskie', code: '16')
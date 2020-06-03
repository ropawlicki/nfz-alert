# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User seed

(1..5).each do |n|
  User.create(email: "user#{n}@example.com", password: "123456", confirmed_at: DateTime.now)
end

# Province codes for API queries

ProvinceCode.create(name: 'Dolnośląskie', code: '01')
ProvinceCode.create(name: 'Kujawsko-pomorskie', code: '02')
ProvinceCode.create(name: 'Lubelskie', code: '03')
ProvinceCode.create(name: 'Lubuskie', code: '04')
ProvinceCode.create(name: 'Łódzkie', code: '05')
ProvinceCode.create(name: 'Małopolskie', code: '06')
ProvinceCode.create(name: 'Mazowieckie', code: '07')
ProvinceCode.create(name: 'Opolskie', code: '08')
ProvinceCode.create(name: 'Podkarpackie', code: '09')
ProvinceCode.create(name: 'Podlaskie', code: '10')
ProvinceCode.create(name: 'Pomorskie', code: '11')
ProvinceCode.create(name: 'Śląskie', code: '12')
ProvinceCode.create(name: 'Świętokrzyskie', code: '13')
ProvinceCode.create(name: 'Warmińsko-mazurskie', code: '14')
ProvinceCode.create(name: 'Wielkopolskie', code: '15')
ProvinceCode.create(name: 'Zachodnio-pomorskie', code: '16')
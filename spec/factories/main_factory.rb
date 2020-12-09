# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'testosław@testmail.com' }
    password { '123456' }
    last_sent_at { Time.zone.now }
    confirmed_at { Time.zone.now }
  end

  factory :query do
    self.case { 1 }
    province { '01' }
    locality { 'testowo' }
    benefit { 'testolog' }
    created_at { Time.zone.now }
  end

  factory :result do
    benefit { "#{Faker::Creature::Animal.name}olog" }
    provider { Faker::Books::Lovecraft.location }
    place { Faker::Address.city }
    address { Faker::Address.street_name }
    date { '2020-01-01' }
  end
end

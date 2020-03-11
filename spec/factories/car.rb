FactoryBot.define do
  factory :car do
    title {Faker::Vehicle.make}
    description {Faker::Vehicle.standard_specs.first}
    price {rand(1112.10...90000.99)}
  end
  end
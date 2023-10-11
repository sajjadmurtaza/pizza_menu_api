# frozen_string_literal: true

FactoryBot.define do
  factory :menu do
    sequence(:name) { |n| "Pizza Type #{('A'..'Z').to_a[n % 26]}" }
    price { rand(5..30) }
  end
end

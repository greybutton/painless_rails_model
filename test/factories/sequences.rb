# frozen_string_literal: true

FactoryBot.define do
  sequence :username do
    Faker::Internet.username
  end

  sequence :address do
    Faker::Address.street_address
  end

  sequence :email do
    Faker::Internet.email
  end

  sequence :profession do
    Faker::Job.position
  end

  sequence :workplace do
    Faker::Job.field
  end
end

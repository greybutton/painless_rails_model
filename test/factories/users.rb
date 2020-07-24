# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username
    address
    email
    agree_with_terms_and_policies { true }
  end

  trait :moderator do
    role { :moderator }
    profession
    workplace
  end

  trait :legal do
    role { :legal }
  end
end

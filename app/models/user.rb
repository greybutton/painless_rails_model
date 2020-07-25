# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize
  include AASM
  include UserRepository

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  enumerize :role, in: %i[user moderator legal], default: :user, predicates: true

  aasm :state, column: :state do
    state :permitted, initial: true
    state :banned

    event :ban do
      transitions from: %i[permitted], to: :banned
    end

    event :unban do
      transitions from: %i[banned], to: :permitted
    end
  end
end

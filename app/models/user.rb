# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize
  include AASM

  before_save :set_latitude, :set_longitude
  # Check address is not nil, not address string
  # validate :latitude, :longitude

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

  def username=(value)
    super(value.mb_chars.downcase)
  end

  def email=(value)
    super(value.mb_chars.downcase)
  end

  def set_latitude
    self.latitude = UserService.latitude(address)
  end

  def set_longitude
    self.longitude = UserService.longitude(address)
  end
end

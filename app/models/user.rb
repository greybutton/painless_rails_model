# frozen_string_literal: true

class User < ApplicationRecord
  extend Enumerize

  enumerize :role, in: %i[user moderator legal], default: :user, predicates: true

  def username=(value)
    super(value.mb_chars.downcase)
  end

  def email=(value)
    super(value.mb_chars.downcase)
  end
end

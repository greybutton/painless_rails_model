# frozen_string_literal: true

class Web::User::UpdateForm < User
  include ActiveFormModel

  permit :username, :address, :email

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email: true, confirmation: true
  validates :email_confirmation, presence: true
end

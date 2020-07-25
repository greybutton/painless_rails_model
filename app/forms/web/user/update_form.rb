# frozen_string_literal: true

class Web::User::UpdateForm < User
  include ActiveFormModel

  permit :username, :address

  validates :email, email: true, confirmation: true
  validates :email_confirmation, presence: true
end

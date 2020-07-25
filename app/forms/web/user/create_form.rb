# frozen_string_literal: true

class Web::User::CreateForm < User
  include ActiveFormModel

  permit :username, :address, :email, :agree_with_terms_and_policies

  validates :email, email: true, confirmation: true
  validates :email_confirmation, presence: true
  validates_inclusion_of :agree_with_terms_and_policies, in: [true, false]
end

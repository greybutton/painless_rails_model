# frozen_string_literal: true

class Web::Legal::CreateForm < User
  include ActiveFormModel

  attribute :create_organization, :boolean, default: false

  permit :username, :address, :email, :profession, :workplace, :agree_with_terms_and_policies, :create_organization

  validates :email, email: true, confirmation: true
  validates :email_confirmation, presence: true
  validates :profession, presence: true
  validates :workplace, presence: true
  validates_inclusion_of :agree_with_terms_and_policies, in: [true, false]
  validates_inclusion_of :create_organization, in: [true, false]
end

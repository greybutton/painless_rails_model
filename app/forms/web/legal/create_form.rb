# frozen_string_literal: true

class Web::Legal::CreateForm < User
  include ActiveFormModel

  attribute :create_organization, :boolean

  permit :username, :address, :email, :profession, :workplace, :agree_with_terms_and_policies, :create_organization

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email: true, confirmation: true
  validates :email_confirmation, presence: true
  validates :profession, presence: true
  validates :workplace, presence: true
  validates_inclusion_of :agree_with_terms_and_policies, in: [true, false]
  validates_inclusion_of :create_organization, in: [true, false]

  def role=(value)
    super(:legal)
  end

  # TODO: create_organization with default color (Settings.organization.color) in controller (maybe service or mutator)
end

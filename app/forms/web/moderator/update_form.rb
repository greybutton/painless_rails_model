# frozen_string_literal: true

class Web::Moderator::UpdateForm < User
  include ActiveFormModel

  permit :username, :address, :email, :profession, :workplace, :agree_with_terms_and_policies

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, email: true, confirmation: true
  validates :email_confirmation, presence: true
  validates :profession, presence: true
  validates :workplace, presence: true
end

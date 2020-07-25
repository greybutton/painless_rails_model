# frozen_string_literal: true

module UserRepository
  extend ActiveSupport::Concern

  included do
    scope :moderators, -> { where(role: :moderator).order(id: :desc) }
    scope :legals, -> { where(role: :legals).order(id: :desc) }
  end
end

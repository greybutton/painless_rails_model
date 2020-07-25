# frozen_string_literal: true

module OrganizationMutator
  class << self
    def create(user)
      name = "#{user.username}'s organization"
      Organization.create!(owner: user, name: name, color: Settings.organization.color)
    end
  end
end

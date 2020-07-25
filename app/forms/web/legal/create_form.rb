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

  def role=(_value)
    super(:legal)
  end

  # Example create user with organization

  def create
    @user = UserMutator.create(user_params)

    if @user.persisted?
      f(:success)
      redirect_to action: :index
    else
      render :new
    end
  end

  module UserMutator
    class << self
      def create(params)
        user = Web::Legal::CreateForm.new(params)
        can_create_organization = user.save && user_params[:create_organization]
        Organization.create!(owner: user, color: Settings.organization.color) if can_create_organization

        user
      end
    end
  end
end

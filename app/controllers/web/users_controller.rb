# frozen_string_literal: true

class Web::UsersController < Web::ApplicationController
  def new
    @user = Web::User::CreateForm.new
  end

  def create
    @form = Web::User::CreateForm.new(user_params)

    if @form.valid?
      user = UserService.create(@form.attributes)
      User.create!(user)
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @form = @user.becomes(Web::User::UpdateForm)
    @form.assign_attributes(user_params)

    if @form.valid?
      user = UserService.update(@form.attributes)
      @user.update!(user)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user)
  end
end

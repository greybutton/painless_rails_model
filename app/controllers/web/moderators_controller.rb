# frozen_string_literal: true

class Web::ModeratorsController < Web::ApplicationController
  def new
    @moderator = Web::Moderator::CreateForm.new
  end

  def create
    @form = Web::Moderator::CreateForm.new(moderator_params)

    if @form.valid?
      moderator = User::ModeratorService.create(@form.attributes)
      User.create!(moderator)
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @moderator = User.moderators.find(params[:id])
  end

  def update
    @moderator = User.moderators.find(params[:id])
    @form = @moderator.becomes(Web::Moderator::UpdateForm)
    @form.assign_attributes(moderator_params)

    if @form.valid?
      moderator = User::ModeratorService.update(@form.attributes)
      @moderator.update!(moderator)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def moderator_params
    params.require(:moderator)
  end
end

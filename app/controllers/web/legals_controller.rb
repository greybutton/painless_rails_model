# frozen_string_literal: true

class Web::LegalsController < Web::ApplicationController
  def new
    @legal = Web::Legal::CreateForm.new
  end

  def create
    @form = Web::Legal::CreateForm.new(legal_params)

    if @form.valid?
      User::LegalService.create(@form.attributes)
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @legal = User.legals.find(params[:id])
  end

  def update
    @legal = User.legals.find(params[:id])
    @form = @legal.becomes(Web::Legal::UpdateForm)
    @form.assign_attributes(legal_params)

    if @form.valid?
      legal = User::LegalService.update(@form.attributes)
      @legal.update!(legal)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def legal_params
    params.require(:legal)
  end
end

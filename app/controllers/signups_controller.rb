class SignupsController < ApplicationController
  before_filter :set_params

  def show
  end

  def create

  end

private

  def set_params
    @keyword = params[:keyword]
    @signup_form = SignupForm.find_by_keyword(@keyword)
  end

end

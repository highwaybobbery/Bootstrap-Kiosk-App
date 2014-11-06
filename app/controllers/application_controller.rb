class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    setup_path
  end

protected

  def configure_permitted_parameters
    [:first_name, :last_name, :address, :city, :state, :zip, :industry, :company, :phone].each do |key|
      devise_parameter_sanitizer.for(:sign_up) << key
      devise_parameter_sanitizer.for(:account_update) << key
    end
  end

end


class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  include ApplicationHelper 

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :cohort_id, cohort_attributes: [:name, :program, :time]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :cohort_id, cohort_attributes: [:name, :program, :time]], except: [:password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end
end
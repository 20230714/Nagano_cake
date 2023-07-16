class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sing_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :address, :postcode, :phone_number])
  end
end

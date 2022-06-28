class ApplicationController < ActionController::Base
  # before_action :authenticate_admin!, if: :admin_url
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def after_sign_in_path_for(resource)
    if admin_signed_in?
      admin_root_path(resource)
    else
      customer_path(resource)
    end
  end

  def admin_url
    request.fullpath.include?("/admin")
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
            keys:[:last_name, :first_name, :last_name_kana, :first_name_kana,
            :email, :postal_code, :address, :telephone_number])
  end

end

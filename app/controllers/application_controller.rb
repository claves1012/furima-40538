class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday])
  end

#ログイン画面のSigned out successfully.表示を消す場合
#  def after_sign_out_path_for(resource_or_scope)
#    flash.delete(:notice)
#    root_path
#  end
end

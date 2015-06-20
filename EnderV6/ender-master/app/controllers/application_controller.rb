class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
/before_action :set_locale

def set_locale
  I18n.locale = params[:locale] || I18n.default_locale
end

def default_url_options(options={})
  { locale: I18n.locale }
end/

  protect_from_forgery with: :exception
  include SessionsHelper

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Por favor inicie sesión."
        redirect_to login_url
      end
    end
end

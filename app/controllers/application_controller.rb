class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :require_login

  private

  def require_login
    return if logged_in?
    flash[:danger] = t("must_login")
    redirect_to login_url
  end
end

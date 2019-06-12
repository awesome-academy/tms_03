class AdminController < ApplicationController
  before_action :authorized?
  private
  def authorized?
    return if current_user.admin?
    flash[:danger] = t(:authorize_admin_message)
    redirect_to login_path
  end
end

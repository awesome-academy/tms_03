class AdminController < ApplicationController
  before_action :authorized?
  load_and_authorize_resource

  private

  def authorized?
    return if current_user.admin?
    flash[:danger] = t :authorize_admin_message
    sign_out_and_redirect current_user
  end
end

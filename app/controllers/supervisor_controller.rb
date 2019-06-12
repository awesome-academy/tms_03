class SupervisorController < ApplicationController
  before_action :authorized?
  private
  def authorized?
    return if current_user.supervisor?
    flash[:danger] = t(:authorize_supervisor_message)
    redirect_to login_path
  end
end
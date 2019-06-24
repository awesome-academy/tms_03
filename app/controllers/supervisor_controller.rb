class SupervisorController < ApplicationController
  before_action :authorized?

  private

  def authorized?
    return if current_user.supervisor?
    flash[:danger] = t :authorize_supervisor_message
    sign_out_and_redirect current_user
  end
end

class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    render layout: "login_layout"
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      log_in(user)
      flash[:success] = t(:wecome_back)
      redirect_to root_url
    else
      flash[:danger] = t("invalid_credentials")
      redirect_to login_url
    end
  end

  def destroy
    @current_user = session[:current_user_id] = nil
    redirect_to login_url
  end
end

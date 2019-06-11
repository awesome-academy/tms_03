class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    render layout: false
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:current_user_id] = user.id
      flash[:success] = t(:wecome_back)
      redirect_to root_url
    else
      flash.now[:danger] = t("message.invalid_credentials")
      render :new
    end
  end

  def destroy
    @_current_user = session[:current_user_id] = nil
    redirect_to root_url
  end
end

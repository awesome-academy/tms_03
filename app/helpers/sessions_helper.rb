module SessionsHelper
  def current_user
    return unless session[:current_user_id]
    @current_user ||= User.find_by(id: session[:current_user_id])
  end

  def log_in user
    session[:current_user_id] = user.id
  end

  def log_out
    session.delete(:current_user_id)
    @current_user = nil
  end

  def logged_in?
    !current_user.nil?
  end
end

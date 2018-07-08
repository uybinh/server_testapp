module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    
  end

  def logged_in?
    !current_user.nil?
  end

  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    @current_user ||= session_user || cookie_user
  end

  def session_user
    User.find_by(id: session[:user_id])
  end

  def cookie_user
    User.find_by(id: cookies.permanent.signed[:user_id])
  end

end

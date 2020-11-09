module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in?              #return true if current/user is not nil
    !current_user.nil?        #check if current_user is not nill
  end
  def current_user
    User.find_by(id: session[:user_id])
  end
end

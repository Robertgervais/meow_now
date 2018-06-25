module SessionsHelper
  def logout_user
    session[:user_id] = nil
  end

  def login_user
    session[:user_id] = @user.id
  end

  def logged_in
    session[:user_id] != nil
  end

  def current_user
   @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user_is_admin
      if current_user
        current_user.admin
      end
  end

end

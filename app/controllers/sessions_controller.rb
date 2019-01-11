class SessionsController < ApplicationController
  include SessionsHelper
  
  def index
  end

	def new
		@user = User.new
	end

  def create
    @user = User.find_by(email: user_params[:email].downcase)
    if @user && @user.authenticate(user_params[:password]) && @user.confirmed
        login_user
        redirect_to ballots_path
    else
      flash[:alert] = "Login failed"
      @errors = ["That combination of username and password can't be found"]
      redirect_to login_path
    end
  end

	def destroy
    logout_user
    redirect_to login_path
	end

private
  def user_params
      params.require(:user).permit(:email, :password)
  end
end

class UsersController < ApplicationController
  include SessionsHelper

  def new
    @user = User.new
  end

  def index
    if logged_in
      @users = User.where("confirmed" => true).all.order("username asc")
    else
      redirect_to "login"
    end
  end

  def committee
  end

  def awaiting_confirmation
    if current_user_is_admin
      @users = User.where("confirmed" => "false").all
    else
      redirect_to "login"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #send confirmation
      UsersMailer.signup_confirmation(@user).deliver
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end

  def change_password
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :confirmed, :membership, :active, :admin)
  end
end

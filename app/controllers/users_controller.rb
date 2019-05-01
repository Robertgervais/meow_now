class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    if user_signed_in?
      @users = User.where(confirmed: true).order(username: :asc)
    else
      redirect_to user_session_path
    end
  end

  def awaiting_confirmation
    if current_user.admin
      @users = User.where("confirmed" => "false").all
    else
      redirect_to "login"
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to ballots_path
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
    usable_params = user_params.except(:user_roles)
    p usable_params
    @user = User.find(params[:id])
    if @user.update_attributes(usable_params)
      update_roles(@user)
      redirect_to users_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :confirmed, :membership, :active, :admin, { :user_roles => [] })
  end

  def update_roles(user)
    params[:user][:user_roles][1..-1].each do |role|
      if !UserRole.find_by(user_id: user.id, role_id: role.to_i)
        user.user_roles.create(role_id: role.to_i)
      end
    end
  end
end

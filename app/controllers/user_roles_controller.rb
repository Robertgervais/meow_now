class UserRolesController < ApplicationController
  def destroy
    deleted_roles = params[:user][:role_ids].select { |role| !role.empty? }
    deleted_roles.each do |role|
      @role = UserRole.find_by(user_id: params[:id], role_id: role)
      @role.destroy
    end
    redirect_to users_path
  end

  def remove_roles
    @user = User.find(params[:id])
    @roles = @user.roles
  end
end

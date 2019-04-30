class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to ballots_path
    else
      redirect_to new_role_path
    end
  end

  private

  def role_params
    params.require(:role).permit(:name, :description)
  end
end

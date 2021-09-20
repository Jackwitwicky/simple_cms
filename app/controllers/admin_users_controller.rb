class AdminUsersController < ApplicationController

  before_action :confirm_logged_in
  layout 'admin'

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_user_params)

    if @admin_user.save
      flash[:notice] = 'Admin has been saved successfully'
      redirect_to admin_users_path
    else
      flash.now[:notice] = 'Admin was not saved successfully'
      render 'new'
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])

    if @admin_user.update(admin_user_params)
      flash[:notice] = 'Admin has been updated successfully'
      redirect_to admin_users_path
    else
      flash.now[:notice] = 'Admin has not been updated'
      render 'edit'
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    
    if @admin_user.destroy
      flash[:notice] = 'Admin has been deleted successfully'
      redirect_to admin_users_path
    else
      flash.now[:notice] = 'Admin has not beed deleted'
      render delete_admin_user_path
    end
  end

  private

  def admin_user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end
end

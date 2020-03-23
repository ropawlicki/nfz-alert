class AdminController < ApplicationController
  before_action :admin_check

  def index
    @users = User.all
  end

  def new_password
  end

  def update_password
    user = User.find(params[:id])
    user.password = params[:new_password]
    if user.save
      redirect_to admin_index_path
    else
      flash[:alert] = user.errors.full_messages
      redirect_to admin_new_password_path
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_index_path
  end

  private

    def admin_check
      redirect_to authenticated_root_path if !current_user.admin?
    end
end

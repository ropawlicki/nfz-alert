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
    user.save
    p "NEW PASSWORD IS ", user.password
    redirect_to admin_index_path
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_index_path
  end

  private

    def admin_check
      if !current_user.admin?
        redirect_to authenticated_root_path
      end
    end
end

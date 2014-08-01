class AdminsController < ApplicationController

  def show
    @admin = Admin.find(params[:id])
  end

  private

  def admin_params
    params.require(:admin).permit(:username, :password)
  end
end

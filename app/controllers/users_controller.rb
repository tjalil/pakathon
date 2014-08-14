class UsersController < ApplicationController

  before_filter :find_admin, only: [:new, :create, :edit, :update, :destroy]
  before_filter :find_city, only: [:new, :create, :edit, :update, :destroy]
  before_filter :find_user, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "#{@user.name} successfully created!"
    else
      render :new, alert: "There was an issue creating this user. Please try again."
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "#{@user.name} successfully updated!"
    else
      render :new, alert: "There was an issue updating this user's info. Please try again."
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :description, :avatar, :type_of_user, :twitter, :linkedin, :city_id)
  end

  def find_admin
    @admin = Admin.find(params[:admin_id])
  end

  def find_city
    @city = City.find(params[:city_id])
  end

  def find_user
    @user = User.find(params[:id])
  end

end

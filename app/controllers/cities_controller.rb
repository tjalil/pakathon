class CitiesController < ApplicationController

  before_filter :require_login, except: [:index, :show, :get_involved]
  before_filter :find_city, only: [:show, :edit, :update, :dashboard, :get_involved]
  before_filter :find_user, only: [:edit, :update, :destroy, :dashboard]

  def index
    @cities = City.all
    @global = City.find_by(name: "Boston")
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to city_path(@city), notice: "#{@city.name} successfully created!"
    else
      render :new, alert: "There was an issue creating this city. Please try again."
    end
  end

  def show
    @global = City.find_by(name: "Boston")
  end

  def edit
  end

  def update
    if @city.update_attributes(city_params)
      redirect_to city_path(@city), notice: "Successfully updated #{@city.name}!"
    else
      render :new, alert: "There was an issue updating #{@city.name}'s details. Please try again."
    end
  end

  def destroy
  end

  def dashboard
  end

  private

  def city_params
    params.require(:city).permit(:name, :address, :background_img, :email, :phone, :facebook, :twitter, :eventbrite_page, :hero_copy, :map_photo, :building_name, :province_name, :postal_code, :team_description)
  end

  def find_city
    @city = City.friendly.find(params[:id])
  end

  def find_user
    @admin = Admin.find(current_user.id)
  end

  def not_authenticated
    redirect_to root_path, alert: "You do not have access to this page."
  end

end

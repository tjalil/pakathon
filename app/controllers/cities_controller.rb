class CitiesController < ApplicationController

  before_filter :require_login, except: [:index, :show]
  before_filter :find_city, only: [:show]

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)

    if @city.save
      redirect_to city_path(@city), notice: "#{@city.name} successfully created!"
    else
      render :new, alert: "There was an issue creating the city. Please try again."
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def city_params
    params.require(:city).permit(:name, :address, :background_img, :email, :phone, :facebook, :twitter, :eventbrite_page)
  end

  def find_city
    @city = City.find(params[:id])
  end

  def not_authenticated
    redirect_to root_path, alert: "You do not have access to this page."
  end

end

class HackathonsController < ApplicationController
  before_filter :require_login
  before_filter :find_city
  before_filter :find_user
  before_filter :find_hackathon, only: [:edit, :update]

  def new
    @hackathon = Hackathon.new
  end

  def create
    @hackathon = Hackathon.new(hackathon_params)
    @hackathon.city_id = @city.id

    if @hackathon.save
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Hackathon details successfully created!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @hackathon.update_attributes(hackathon_params)
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Successfully updated hackathon details"
    else
      render :edit, alert: "There was an issue updating the hackathon details. Please try again."
    end
  end

  private

  def hackathon_params
    params.require('hackathon').permit(:date_of_hackathon, :venue_name, :address_line_1, :postal_code, :eventbrite_link, :day_1_image, :day_1_description, :day_2_image, :day_2_description, :day_3_image, :day_3_description, :judging_criteria, :city_id)
  end

  def find_city
    @city = City.friendly.find(params[:city_id])
  end

  def find_user
    @admin = Admin.find(current_user.id)
  end

  def find_hackathon
    @hackathon = Hackathon.find(params[:id])
  end

  def not_authenticated
    redirect_to root_path, alert: "You do not have access to this page."
  end
end

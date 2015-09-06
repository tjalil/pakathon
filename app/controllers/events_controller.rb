class EventsController < ApplicationController
  before_filter :require_login
  before_filter :find_city
  before_filter :find_user
  before_filter :find_event, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.city_id = @city.id

    if @event.save
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Successfully added a new event"
    else
      render :new, alert: "There was an issue creating this event. Please try again."
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Successfully added a new event"
    else
      render :edit, alert: "There was an issue editing this event. Please try again."
    end
  end

  def destroy
    @event.destroy
    redirect_to dashboard_admin_city_path(current_user, @city), notice: "Event successfully deleted"
  end

  private

  def event_params
    params.require('event').permit(:event_image, :event_date, :event_time, :event_name, :venue_name, :address_line_1, :postal_code, :event_description, :eventpage_link, :city_id)
  end

  def find_city
    @city = City.friendly.find(params[:city_id])
  end

  def find_user
    @admin = Admin.find(current_user.id)
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def not_authenticated
    redirect_to root_path, alert: "You do not have access to this page."
  end
end

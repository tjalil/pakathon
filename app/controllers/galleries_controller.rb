class GalleriesController < ApplicationController
  before_filter :require_login
  before_filter :find_city
  before_filter :find_user
  before_filter :find_gallery, only: [:edit, :update, :destroy]

  def new
    @gallery = Gallery.new
  end

  def create
    @gallery = Gallery.new(gallery_params)
    @gallery.city_id = @city.id

    if @gallery.save
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Successfully added gallery images"
    else
      render :new, alert: "There was an issue creating this event. Please try again."
    end
  end

  def edit
  end

  def update
    if @gallery.update_attributes(gallery_params)
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Successfully updated the gallery images"
    else
      render :edit, alert: "There was an issue editing this event. Please try again."
    end
  end

  def destroy
    @gallery.destroy
    redirect_to dashboard_admin_city_path(current_user, @city), notice: "Gallery successfully deleted"
  end

  private

  def gallery_params
    params.require('gallery').permit(:image_1, :image_2, :image_3, :image_4, :link_to_gallery, :city_id)
  end

  def find_city
    @city = City.friendly.find(params[:city_id])
  end

  def find_user
    @admin = Admin.find(current_user.id)
  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
  end

  def not_authenticated
    redirect_to root_path, alert: "You do not have access to this page."
  end
end

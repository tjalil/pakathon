class ResourcesController < ApplicationController

  before_filter :find_admin, except: [:index]
  before_filter :find_resource, only: [:edit, :update, :destroy]

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def my_resources
    if current_user.username == "taha.jalil"
      @resources = Resource.all
    else
      @resources = @admin.resources
    end
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to my_resources_admin_resources_path(current_user), notice: "Resource successfully added."
    else
      render :new, alert: "Unable to add resource. Please try again."
    end
  end

  def edit
  end

  def update
    if @resource.update_attribute(resource_params)
      redirect_to my_resources_admin_resources_path(current_user), notice: "Resource successfully edited."
    else
      render :edit, alert: "Unable to edit resource. Please try again."
    end
  end

  def destroy
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :series, :type_of_document, :twitter_canned_message, :facebook_canned_message, :link_to_muut_discussion, :link_to_document, :link_to_download)
  end

  def find_admin
    @admin = Admin.find(current_user.id)
  end

  def find_resource
    @resource = Resource.find(params[:id])
  end
end

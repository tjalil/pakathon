class ResourcesController < ApplicationController

  def index
    @resources = Resource.all
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)

    if @resource.save
      redirect_to admin_path(current_user), notice: "Resource successfully added."
    else
      render :new, alert: "Unable to add resource. Please try again."
    end
  end

  def edit
  end

  def update
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
end

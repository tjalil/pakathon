class ProjectsController < ApplicationController
  before_filter :require_login
  before_filter :find_city
  before_filter :find_user
  before_filter :find_project, only: [:edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.city_id = @city.id

    if @project.save
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Successfully added a new project"
    else
      render :new, alert: "There was an issue creating this event. Please try again."
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Successfully updated the event"
    else
      render :edit, alert: "There was an issue editing this event. Please try again."
    end
  end

  def destroy
    @project.destroy
    redirect_to dashboard_admin_city_path(current_user, @city), notice: "Project successfully deleted"
  end

  private

  def project_params
    params.require('project').permit(:project_name, :project_url, :names_of_team_members, :project_description, :project_video_url, :project_photo, :city_id)
  end

  def find_city
    @city = City.friendly.find(params[:city_id])
  end

  def find_user
    @admin = Admin.find(current_user.id)
  end

  def find_project
    @project = Project.find(params[:id])
  end

  def not_authenticated
    redirect_to root_path, alert: "You do not have access to this page."
  end
end

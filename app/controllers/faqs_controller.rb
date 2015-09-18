class FaqsController < ApplicationController
  before_filter :require_login, except: [:index]
  before_filter :find_city, except: [:index]
  before_filter :find_user, except: [:index]
  before_filter :find_faq, only: [:edit, :update, :destroy]

  def index
    @faqs = City.find(18).faqs
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)
    @faq.city_id = @city.id

    if @faq.save
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Successfully added a new FAQ"
    else
      render :new, alert: "There was an issue creating this event. Please try again."
    end
  end

  def edit
  end

  def update
    if @faq.update_attributes(faq_params)
      redirect_to dashboard_admin_city_path(current_user, @city), notice: "Successfully updated the FAQ"
    else
      render :edit, alert: "There was an issue editing this event. Please try again."
    end
  end

  def destroy
    @faq.destroy
    redirect_to dashboard_admin_city_path(current_user, @city), notice: "FAQ successfully deleted"
  end

  private

  def faq_params
    params.require('faq').permit(:question, :answer, :city_id)
  end

  def find_city
    @city = City.friendly.find(params[:city_id])
  end

  def find_user
    @admin = Admin.find(current_user.id)
  end

  def find_faq
    @faq = Faq.find(params[:id])
  end

  def not_authenticated
    redirect_to root_path, alert: "You do not have access to this page."
  end
end

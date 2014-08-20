class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to root_path, notice: "Thank you for signing up to our mailing list"
    else
      render :new, alert: "Oops, something went wrong. We'd love to hear from you. Please try again."
    end
  end

  def show
    @contact = Contact.find(params[:id])
    @contacts = Contact.all
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message, :city_id)
  end
end

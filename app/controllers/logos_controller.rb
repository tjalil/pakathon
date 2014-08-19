class LogosController < ApplicationController

  def new
    @logo = Logo.new
  end

  def create
    @logo = Logo.new(logo_params)

    if @logo.save
      redirect_to root_path, notice: "#{@logo.name} successfully created!"
    else
      render :new, alert: "There was an issue saving this logo. Please try again."
    end
  end

  private

  def logo_params
    params.require(:logo).permit(:name, :image)
  end
end

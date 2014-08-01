class AdminSessionsController < ApplicationController

  def dekh_magar_pyar_say
    @admin = Admin.new
  end

  def create
    if @admin = login(params[:username], params[:password])
      redirect_to admin_path(@admin), notice: "Successfully logged in as #{@admin.username}!"
    else
      flash.now[:alert] = 'Login failed. Check your username or password.'
      render :new
    end
  end

  def destroy
    logout
    redirect_to cities_path, notice: "Logged Out!"
  end

end

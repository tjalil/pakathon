class PagesController < ApplicationController

  def toronto_baithak
  end

  # def homepage
  # end

  def program
  end

  def team
    @users = City.find(18).users
    @sponsors = City.find(18).sponsors
  end

  def contact
  end

  def resources
  end

end

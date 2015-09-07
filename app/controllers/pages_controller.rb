class PagesController < ApplicationController

  def toronto_baithak
  end

  def homepage
  end

  def program
  end

  def streams
  end

  def team
    @users = City.find(18).users.order('name ASC')
    @sponsors = City.find(18).sponsors
  end

  def contact
  end 

end

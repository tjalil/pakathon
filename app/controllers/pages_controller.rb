class PagesController < ApplicationController

  def toronto_appetizer
  end

  def homepage
  end

  def program
    @mentor = User.find_by_type_of_user('Mentor')
  end

  def streams
  end

  def team
    @users = City.find(18).users.order('name ASC')
    @sponsors = User.where(type_of_user: "Sponsor")
  end

  def contact
  end 

end

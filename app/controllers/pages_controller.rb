class PagesController < ApplicationController

  def toronto_appetizer
  end

  def global_final
    # @datetime = DateTime.new(2015,11,8,11,0,0)
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

class PagesController < ApplicationController

  def toronto_baithak
  end

  def dekhmagarpyarsay_homepage_proto
  end

  def dekhmagarpyarsay_hackathon_proto
  end

  def dekhmagarpyarsay_team_proto
    @users = City.find(18).users
  end

  def dekhmagarpyarsay_contact_proto
  end 

end

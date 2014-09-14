class City < ActiveRecord::Base
  has_many :users
  belongs_to :admin
  has_many :contacts
  mount_uploader :background_img, ImageUploader
  mount_uploader :map_photo, ImageUploader

  extend FriendlyId
  friendly_id :name, use: :slugged

  def judges
    self.users.where(type_of_user: "Judge")
  end

  def team_members
    self.users.where(type_of_user: "Team Member")
  end

  def mentors
    self.users.where(type_of_user: "Mentor")
  end

  def sponsors
    self.users.where(type_of_user: "Sponsor")
  end

end
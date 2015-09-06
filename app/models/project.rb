class Project < ActiveRecord::Base
  belongs_to :city

  mount_uploader :project_photo, ImageUploader
end

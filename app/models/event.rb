class Event < ActiveRecord::Base
  belongs_to :city

  mount_uploader :event_image, ImageUploader
end

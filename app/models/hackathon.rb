class Hackathon < ActiveRecord::Base
  belongs_to :city

  mount_uploader :day_1_image, ImageUploader
  mount_uploader :day_2_image, ImageUploader
  mount_uploader :day_3_image, ImageUploader
end

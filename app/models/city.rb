class City < ActiveRecord::Base
  has_many :users
  belongs_to :admin
  mount_uploader :background_img, ImageUploader
end

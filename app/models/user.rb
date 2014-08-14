class User < ActiveRecord::Base
  belongs_to :city
  mount_uploader :avatar, ImageUploader
end

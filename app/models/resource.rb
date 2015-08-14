class Resource < ActiveRecord::Base
  belongs_to :admin
  mount_uploader :email_course_banner, ImageUploader
end

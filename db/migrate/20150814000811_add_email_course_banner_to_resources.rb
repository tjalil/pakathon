class AddEmailCourseBannerToResources < ActiveRecord::Migration
  def change
    add_column :resources, :email_course_banner, :string
  end
end

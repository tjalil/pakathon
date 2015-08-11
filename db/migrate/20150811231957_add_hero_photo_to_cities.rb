class AddHeroPhotoToCities < ActiveRecord::Migration
  def change
    add_column :cities, :hero_photo, :string
  end
end

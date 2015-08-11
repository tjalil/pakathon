class ReplaceHeroPhotoUrlDatatypeFromCities < ActiveRecord::Migration
  def up
    remove_column :cities, :hero_photo_url, :string
    add_column :cities, :hero_photo_url, :text
  end

  def down
    add_column :cities, :hero_photo_url, :string
    remove_column :cities, :hero_photo_url, :text
  end
end

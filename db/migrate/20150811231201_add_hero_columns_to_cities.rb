class AddHeroColumnsToCities < ActiveRecord::Migration
  def change
    add_column :cities, :hero_photo_url, :string
    add_column :cities, :hero_photographer_name, :string
    add_column :cities, :hero_photographer_page, :string
  end
end

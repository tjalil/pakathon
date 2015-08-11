class RemoveColumnsFromCities < ActiveRecord::Migration
  def up
    remove_column :cities, :background_img, :string
    remove_column :cities, :building_name, :string
  end

  def down
    add_column :cities, :background_img, :string
    add_column :cities, :building_name, :string
  end
end

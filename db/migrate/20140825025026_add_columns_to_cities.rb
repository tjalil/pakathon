class AddColumnsToCities < ActiveRecord::Migration
  def change
    add_column :cities, :building_name, :string
    add_column :cities, :province_name, :string
    add_column :cities, :postal_code, :string
  end
end

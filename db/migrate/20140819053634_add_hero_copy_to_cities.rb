class AddHeroCopyToCities < ActiveRecord::Migration
  def change
    add_column :cities, :hero_copy, :text
  end
end

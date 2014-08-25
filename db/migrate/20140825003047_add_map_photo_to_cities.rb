class AddMapPhotoToCities < ActiveRecord::Migration
  def change
    add_column :cities, :map_photo, :string
  end
end

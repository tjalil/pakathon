class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.text :image_1
      t.text :image_2
      t.text :image_3
      t.text :image_4
      t.text :link_to_gallery
      t.integer :city_id

      t.timestamps
    end

    add_index :galleries, :city_id
  end
end

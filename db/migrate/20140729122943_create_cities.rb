class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :address
      t.string :background_img
      t.string :address
      t.string :email
      t.integer :phone
      t.string :facebook
      t.string :twitter
      t.string :eventbrite_page
      t.integer :user_id

      t.timestamps
    end
  end
end

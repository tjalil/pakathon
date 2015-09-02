class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :event_image
      t.datetime :event_date
      t.time :event_time
      t.string :event_name
      t.text :address_line_1
      t.text :postal_code
      t.text :event_description
      t.text :eventpage_link
      t.integer :city_id

      t.timestamps
    end

    add_index :events, :city_id
  end
end

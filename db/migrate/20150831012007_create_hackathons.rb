class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.datetime :date_of_hackathon
      t.string :venue_name
      t.string :address_line_1
      t.string :postal_code
      t.text :eventbrite_link
      t.text :day_1_image
      t.text :day_1_description
      t.text :day_2_image
      t.text :day_2_description
      t.text :day_3_image
      t.text :day_3_description
      t.text :judging_criteria
      t.integer :city_id

      t.timestamps
    end

    add_index :hackathons, :city_id
  end
end

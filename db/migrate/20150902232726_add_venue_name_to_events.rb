class AddVenueNameToEvents < ActiveRecord::Migration
  def up
    add_column :events, :venue_name, :string
  end

  def down
    remove_column :events, :venue_name, :string
  end
end

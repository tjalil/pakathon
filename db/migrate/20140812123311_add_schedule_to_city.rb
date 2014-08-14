class AddScheduleToCity < ActiveRecord::Migration
  def change
    add_column :cities, :schedule, :hstore
  end
end

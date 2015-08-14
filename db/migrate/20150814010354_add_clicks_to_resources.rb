class AddClicksToResources < ActiveRecord::Migration
  def change
    add_column :resources, :clicks, :integer
  end
end

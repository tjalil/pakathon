class AddAdminIdToCity < ActiveRecord::Migration
  def change
    add_column :cities, :admin_id, :integer
  end
end

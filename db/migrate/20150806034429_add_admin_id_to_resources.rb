class AddAdminIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :admin_id, :integer

    add_index :resources, :admin_id
  end
end

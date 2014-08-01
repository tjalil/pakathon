class RemoveUserIdFromCity < ActiveRecord::Migration
  def change
    remove_column :cities, :user_id, :integer
  end
end

class RemoveFavFoodFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :fav_food, :string
  end

  def down
    remove_column :users, :fav_food, :string
  end
end

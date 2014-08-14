class AddFavFoodToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fav_food, :string
  end
end

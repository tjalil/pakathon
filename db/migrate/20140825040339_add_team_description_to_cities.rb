class AddTeamDescriptionToCities < ActiveRecord::Migration
  def change
    add_column :cities, :team_description, :text
  end
end

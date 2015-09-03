class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.text :project_name
      t.text :project_url
      t.string :names_of_team_members
      t.text :project_description
      t.text :project_video_url
      t.text :project_photo
      t.integer :city_id

      t.timestamps
    end

    add_index :projects, :city_id
  end
end

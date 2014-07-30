class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.text :description
      t.string :avatar
      t.string :type_of_user
      t.string :twitter
      t.string :linkedin

      t.timestamps
    end
  end
end

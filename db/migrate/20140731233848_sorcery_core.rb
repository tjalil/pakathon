class SorceryCore < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username,         :null => false
      t.string :crypted_password, :null => false
      t.string :salt,             :null => false

      t.timestamps
    end

    add_index :admins, :username, unique: true
  end
end
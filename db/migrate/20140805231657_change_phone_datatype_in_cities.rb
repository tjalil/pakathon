class ChangePhoneDatatypeInCities < ActiveRecord::Migration
  def up
    change_column :cities, :phone, :string
  end

  def down
    change_column :cities, :phone, :integer
  end
end

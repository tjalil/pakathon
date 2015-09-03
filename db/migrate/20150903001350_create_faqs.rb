class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.text :question
      t.text :answer
      t.integer :city_id

      t.timestamps
    end

    add_index :faqs, :city_id
  end
end

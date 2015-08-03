class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :series
      t.string :type_of_document
      t.string :twitter_canned_message
      t.string :facebook_canned_message
      t.string :link_to_muut_discussion
      t.string :link_to_document
      t.string :link_to_download

      t.timestamps
    end
  end
end

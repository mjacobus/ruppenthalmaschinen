class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :imageable_id
      t.string :imageable_type
      t.string :title
      t.text :description
      t.integer :sequence
      t.string :file_file_name
      t.integer :file_file_size
      t.string :file_content_type
      t.datetime :file_updated_at

      t.timestamps
    end
  end
end

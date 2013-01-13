class AddVideoDescriptionToProducts < ActiveRecord::Migration
  def change
    add_column :products, :video_description, :text
  end
end

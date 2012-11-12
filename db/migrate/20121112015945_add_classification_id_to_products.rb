class AddClassificationIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :classification_id, :integer
    add_index :products, :classification_id
  end
end

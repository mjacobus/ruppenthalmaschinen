class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :name
      t.string :value
      t.references :product

      t.timestamps
    end
    add_index :features, :product_id
  end
end

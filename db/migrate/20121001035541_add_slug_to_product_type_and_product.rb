class AddSlugToProductTypeAndProduct < ActiveRecord::Migration
  def change
    add_column :products, :slug, :string
    add_column :product_types, :slug, :string
  end
end

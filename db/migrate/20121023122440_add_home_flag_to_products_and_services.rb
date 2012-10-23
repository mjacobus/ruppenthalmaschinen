class AddHomeFlagToProductsAndServices < ActiveRecord::Migration
  def change
    add_column :products, :home, :boolean
    add_column :services, :home, :boolean
  end
end

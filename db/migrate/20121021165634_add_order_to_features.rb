class AddOrderToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :sequence, :integer, :default => 0, :null => false
  end
end

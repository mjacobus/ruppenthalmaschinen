class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.boolean :enabled

      t.timestamps
    end
  end
end

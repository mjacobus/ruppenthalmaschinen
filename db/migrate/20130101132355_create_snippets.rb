class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :title
      t.string :slug
      t.text :content

      t.timestamps
    end
  end
end

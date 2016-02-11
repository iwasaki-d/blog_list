class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :body
      t.integer :blog_id

      t.timestamps null: false
    end
  end
end

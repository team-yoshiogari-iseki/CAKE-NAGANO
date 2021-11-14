class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :body
      t.string :genre
      t.integer :price, null: false
      t.image :text
      t.status :string, null: false

      t.timestamps
    end
  end
end

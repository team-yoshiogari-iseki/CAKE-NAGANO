class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.integer :genre_id,  nill:false
      t.integer :price, null: false
      t.text :image, null: false
      t.boolean :status, null: false

      t.timestamps null: false
    end
  end
end

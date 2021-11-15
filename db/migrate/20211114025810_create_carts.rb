class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.integer :item_id ,null:false
      t.integer :_id ,null:false
      t.integer :quantity ,null:false
      
      
      t.timestamps null: false
    end
  end
end

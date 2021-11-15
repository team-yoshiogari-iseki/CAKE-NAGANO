class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      
      t.integer :item_id ,null:false
      t.integer :customer_id ,null:false
      t.integer :quantity ,null:false

      t.timestamps null: false
    end
  end
end

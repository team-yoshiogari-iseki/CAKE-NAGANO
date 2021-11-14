class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|
      
      t.integer :order_id
      t.integer :item_id
      t.integer :price, nill:false
      t.integer :quantity, nill:false
      t.integer :making_status, nill:false
      
      t.timestamps
    end
  end
end

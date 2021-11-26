class CreateOrderDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :order_details do |t|

      t.integer :order_id, nill:false
      t.integer :item_id, nill:false
      t.integer :price, nill:false
      t.integer :quantity, nill:false
      t.integer :making_status, nill:false

      t.timestamps null: false
    end
  end
end

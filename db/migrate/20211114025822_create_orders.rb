class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      
      t.string :postal_code, null: false
      t.string :address, null: false
      t.string :orderer_name, null: false
      t.boolean :payment_way, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.integer :postage, null: false
      t.integer :claimed, null: false
      
      t.timestamps
    end
  end
end

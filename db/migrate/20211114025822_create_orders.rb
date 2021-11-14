class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      
      t.integer :user_id
      t.integer :postal_code, null: false
      t.string :address, null: false
      t.string :orderer_name, null: false
      t.integer :payment_way, null: false, default: 0
      t.string :order_status, null: false, default: 0
      t.integer :postage, null: false
      t.integer :claimed, null: false
      
      t.timestamps
    end
  end
end

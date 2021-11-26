class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :customer_id, nill:false
      t.string :name, nill:false
      t.string :address, nill:false
      t.string :postal_code, nill:false

      t.timestamps null: false
    end
  end
end

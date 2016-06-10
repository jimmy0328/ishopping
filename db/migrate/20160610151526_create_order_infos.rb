class CreateOrderInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :order_infos do |t|
      t.integer :order_id
      t.string :billing_name
      t.string :billing_address
      t.string :billing_tel
      t.string :shipping_name
      t.string :shipping_address
      t.string :shipping_tel

      t.timestamps
    end
  end
end

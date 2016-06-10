class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.integer :user_id
      t.integer :total, null: false, default: 0

      t.timestamps
    end
  end
end

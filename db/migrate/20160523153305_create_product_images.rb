class CreateProductImages < ActiveRecord::Migration[5.0]
  def change
    create_table :product_images do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :product_id

      t.timestamps
    end
  end
end

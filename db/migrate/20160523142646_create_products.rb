class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :cost
      t.decimal :price
      t.string :created_on
      t.string :cover_image
      t.string :tag
      t.boolean :display

      t.timestamps
    end
  end
end

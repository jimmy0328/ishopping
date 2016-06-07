class AddPermalinkToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :permalink, :string
  end
end

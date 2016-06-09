class AddScoreToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :score, :integer, default: 0
  end
end

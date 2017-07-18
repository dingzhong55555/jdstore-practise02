class RenamePruductToProduct < ActiveRecord::Migration[5.0]
  def change
    rename_column :product_lists, :pruduct_price, :product_price
  end
end

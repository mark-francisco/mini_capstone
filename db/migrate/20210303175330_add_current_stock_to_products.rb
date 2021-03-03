class AddCurrentStockToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :current_stock, :integer
  end
end

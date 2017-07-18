class AddTrademarkToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :trademark, :string
  end
end

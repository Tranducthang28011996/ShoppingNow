class AddNameToCategory < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :name_ct, :string
  end
end

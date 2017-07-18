class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.text :description
      t.float :discount
      t.float :price
      t.string :image

      t.timestamps
    end
  end
end

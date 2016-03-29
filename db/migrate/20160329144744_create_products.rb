class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price, default: 0
      t.integer :inventory, default: 0
      t.decimal :shipping_cost, default: 0

      t.timestamps null: false
    end
  end
end

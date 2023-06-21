class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.integer :item_id, null: false
      t.integer :custome_id, null: false
      t.integer :quantity, null: false
      t.timestamps
    end
  end
end

class RenameCutomeIdColumnToCartItems < ActiveRecord::Migration[6.1]
  def change
    rename_column :cart_items, :custome_id, :customer_id
  end
end

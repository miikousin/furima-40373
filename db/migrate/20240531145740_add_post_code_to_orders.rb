class AddPostCodeToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :post_code, :string, null: false
  end
end

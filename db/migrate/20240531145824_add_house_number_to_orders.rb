class AddHouseNumberToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :house_number, :string, null: false
  end
end

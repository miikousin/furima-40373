class AddTelToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :tel, :string, null: false
  end
end

class AddCityToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :city, :string, null: false
  end
end

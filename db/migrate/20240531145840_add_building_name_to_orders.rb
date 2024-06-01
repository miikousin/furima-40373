class AddBuildingNameToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :building_name, :string
  end
end

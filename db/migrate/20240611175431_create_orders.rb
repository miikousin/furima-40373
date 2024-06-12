class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :purchase,      null: false, foreign_key: true
      t.string     :post_code,     null: false
      t.integer    :region_id,     null: false
      t.string     :city,          null: false
      t.string     :house_number,  null: false
      t.string     :building_name
      t.string     :tel,           null: false
      t.timestamps
    end
  end
end

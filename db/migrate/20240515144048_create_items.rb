class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :items_description, null: false
      t.integer :category_id, null: false
      t.integer :postage_id, null: false
      t.integer :region_id, null: false
      t.integer :number_of_day_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

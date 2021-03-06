class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :post_number, null: false
      t.integer :shipment_area_id, null: false
      t.string :city, null: false
      t.string :address, null: false
      t.string :building_name
      t.string :phone_number, null: false
      t.references :history, foreign_key: true
      t.timestamps
    end
  end
end

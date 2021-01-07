class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :delivery_method, null: false
      t.string :postage,         null: false
      t.references :credit,      null: false, foreign_key: true
      t.references :user,        null: false, foreign_key: true
      t.references :ship_address,null: false, foreign_key: true
      t.integer :total_price,    null: false

      t.timestamps
    end
  end
end

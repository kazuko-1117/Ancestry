class CreateOrderHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :order_histories do |t|
      t.references :order,null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.integer :count,   null: false
      
      t.timestamps
    end
  end
end

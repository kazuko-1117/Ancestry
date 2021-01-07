class CreateShipAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ship_addresses do |t|
      t.references :user,         null: false, foreign_key: true
      t.string :first_name,       null: false
      t.string :family_name,      null: false
      t.string :first_name_kana,  null: false
      t.string :family_name_kana, null: false
      t.integer :post_code,       null: false
      t.integer :pref_id,         null: false
      t.string :city,             null: false
      t.string :address_detail,   null: false
      t.string :apartment_detail, null: false
      t.string :phone_number,     null: false

      t.timestamps
    end
  end
end

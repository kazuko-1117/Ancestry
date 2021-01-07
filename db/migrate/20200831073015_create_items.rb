class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,         null: false
      t.text :introduction,   null: false
      t.integer :price,       null: false
      t.string :brand,        null: false
      t.references :category, null: false, foreign_key: true
      t.string :size,         null: false
      t.integer :sale,        null: false

      t.timestamps
    end
  end
end

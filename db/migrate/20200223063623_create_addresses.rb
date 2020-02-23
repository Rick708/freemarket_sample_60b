class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.references :user, foreign_key: true
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_kananame, null: false
      t.string :last_kananame, null: false
      t.integer :post_code, null: false
      t.integer :prefecture_code, null: false
      t.string :address_city, null: false
      t.string :address_street, null: false
      t.string :address_building
      t.timestamps
    end
  end
end

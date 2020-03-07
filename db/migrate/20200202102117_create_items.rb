class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :content
      t.integer :price, null: false
      t.integer :status, default: 0, null: false
      t.integer :delivery_charge
      t.string :send_day
      t.string :size
      t.string :delivery_method
      # t.references :category, foreign_key: true
      # t.references :brand, foreign_key: true
      t.integer :prefecture_code

      t.timestamps
      
    end
  end
end

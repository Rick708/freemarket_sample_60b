class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name, null: false
      t.string :ancestry
      t.timestamps
    end
    add_index :categories, :ancestry
  end
end

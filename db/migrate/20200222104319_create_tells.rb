class CreateTells < ActiveRecord::Migration[5.2]
  def change
    create_table :tells do |t|
      t.integer :telephone, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

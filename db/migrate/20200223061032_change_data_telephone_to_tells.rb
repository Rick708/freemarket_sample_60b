class ChangeDataTelephoneToTells < ActiveRecord::Migration[5.2]
  def change
    change_column :tells, :telephone, :string, null: false
  end
end

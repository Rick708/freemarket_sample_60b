class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :first_name, :last_name, :first_kananame, :last_kananame, :post_code, :prefecture_code, :address_city, :address_street, :address_building ,presence: true
end

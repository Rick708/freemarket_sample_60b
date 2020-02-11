class Item < ApplicationRecord
  has_many :images
  belongs_to :user
  validates :price, presence: true, numericality: { greater_than: 300, less_than: 9999999 }

end

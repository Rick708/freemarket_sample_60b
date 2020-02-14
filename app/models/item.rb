class Item < ApplicationRecord
  belongs_to :user
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :images
  accepts_nested_attributes_for :images
end

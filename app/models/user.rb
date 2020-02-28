class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname ,presence: true

  has_many :items
  has_many :seller_items, class_name: "Item"
  has_many :buyer_items, class_name: "Item"

end

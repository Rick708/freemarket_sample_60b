class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname ,presence: true
  has_many :items
  # has_many :seller, class_name: "User"
  # has_many :buyer, class_name: "User"
end

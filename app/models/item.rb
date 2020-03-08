class Item < ApplicationRecord
# association
  belongs_to :user, optional: true
  belongs_to :seller, class_name: "User",foreign_key:"seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

# enum設定
  enum status: { exhibition: 0, buy: 1, sold: 2}

# validation
  validates :price, presence: true
  validates :name, presence: true, length: { maximum: 13}
  validates :content, length: { maximum: 400}
  validates :images, presence:true, on: :create


  def self.search(search)
    return Item.all unless search
    Item.where(['name LIKE ?', "%#{search}%"])
  end
end



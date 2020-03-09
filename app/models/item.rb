class Item < ApplicationRecord
# association
  belongs_to :user, optional: true
  belongs_to :seller, class_name: "User",foreign_key:"seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

# enum設定
  # 状態
  enum status: { exhibition: 0, buy: 1, sold: 2}
  # 都道府県 
  enum prefecture_code: {
    hokkaido: 0,
    aomori:   1,
    iwate:    2,
    miyagi:   3,
    akita:    4,
    yamagata: 5
    # fukushima:
    # ibaraki:
    # tochigi:
    # gunma:
    # saitama:
    # chiba:
    # tokyo:
    # kanagawa:
    # niigata:
    # toyama:
    # ishikawa:
    # fukui:
    # yamanashi:
    # nagano:
    # gifu:
    # shizuoka:
    # aichi:
    # mie:
    # shiga:
    # kyoto:
    # osaka:
    # hyogo:
    # nara:
    # wakayama:
    # tottori:
    # shimane:
    # okayama:
    # hiroshima:
    # yamaguchi:
    # tokushima:
    # kagawa:
    # ehime:
    # kochi:
    # fukuoka:
    # saga:
    # nagasaki:
    # kumamoto:
    # oita:
    # miyazaki:
    # kagoshima:
    # okinawa:
  }
  # 配送料の負担 
  enum delivery_charge: { include: 0, not: 1}

# validation
  validates :price, presence: true
  validates :name, presence: true, length: { maximum: 13}
  validates :content, length: { maximum: 400}
  validates :images, presence:true, on: :create
end

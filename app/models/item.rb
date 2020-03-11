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
    "北海道":  0,
    "青森県":  1,
    "岩手県":  2,
    "宮城県":  3,
    "秋田県":  4,
    "山形県":  5,
    "福島県":  6,
    "茨城県":  7,
    "栃木県":  8,
    "群馬県":  9,
    "埼玉県":  10,
    "千葉県":  11,
    "東京都":  12,
    "神奈川県":13,
    "新潟県":  14,
    "富山県":  15,
    "石川県":  16,
    "福井県":  17,
    "山梨県":  18,
    "長野県":  19,
    "岐阜県":  20,
    "静岡県":21,
    "愛知県":22,
    "三重県":23,
    "滋賀県":24,
    "京都府":25,
    "大阪府":26,
    "兵庫県":27,
    "奈良県":28,
    "和歌山県":29,
    "鳥取県":30,
    "島根県":31,
    "岡山県":32,
    "広島県":33,
    "山口県":34,
    "徳島県":35,
    "香川県":36,
    "愛媛県":37,
    "高知県":38,
    "福岡県":39,
    "佐賀県":40,
    "長崎県":41,
    "熊本県":42,
    "大分県":43,
    "宮崎県":44,
    "鹿児島県":45,
    "沖縄県":46
  }
  # 配送料の負担 
  enum delivery_charge: { "送料込み(出品者負担)": 0, "着払い(購入者負担)": 1}

# validation
  validates :price, presence: true
  validates :name, presence: true, length: { maximum: 13}
  validates :content, length: { maximum: 400}
  validates :images, presence:true, on: :create


# 検索
  def self.search(search)
    return Item.all unless search
    Item.where(['name LIKE ?', "%#{search}%"])
  end
end



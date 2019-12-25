# Freemarket DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|name|string|null: false|
|birthday|string|null: false|
|password|string|null: false, unique: true|
|telephone|integer|null: false|
|credit＿card_number|integer||
|profile|text||
|profile_image|string||
### Association
- has_many :items
- has_many :comments
- has_many :trades

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|text||
|price|integer|null:false|
|status|string||
|size|string||
|delivery_charge|integer||
|delivery_method|integer||
|delivery_area|string||
|send_day|string||
|user_id|integer|null: false, foreign_key: true|
### Association
- has_many :comments
- has_many :trades
- belongs_to :user

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## tradesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
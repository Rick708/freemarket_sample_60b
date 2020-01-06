# Freemarket DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|name|string|null: false|
|mail|string|null: false, unique: true|
|birthday|string|null: false|
|password|string|null: false, unique: true|
|postal_code|integer|null: false|
|street_address|string|null: false|
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
|item-image_id|integer|foreign_key: true|
### Association
- has_many :comments
- has_many :trades
- has_many :item-images
- belongs_to :user

## item-imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|item_id|integer|null: false, foreign_key|
### Asociation
- belongs_to :item

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
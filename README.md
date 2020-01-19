# Freemarket DB設計
## usersテーブル
- ユーザーテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|first_kananame|string|null: false|
|last_kananame|string|null: false|
|first_name|string|null: false|
|last_name|string|null: false|
|mail|string|null: false, unique: true|
|telephone|string|null: false|
|birthday_year|string|null: false|
|birthday_month|string|null: false|
|birthday_day|string|null: false|
|password|string|null: false, unique: true|
|address_id|integer|null: false, foreign_key: true|
|card_id|integer|foreign_key: true|
|profile|text||
|profile_image|string||
### Association
- has_many :items
- has_many :comments
- has_many :purchases
- has_many :addresses
- has_one  :card

## addressesテーブル
- ユーザー住所テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|intrger|null: false, foreign_key: true|
|post_code|integer|null: false|
|prefecture_code|integer||
|address_city|string||
|address_street|string||
|address_building|string||
### Association
- belongs_to :user

## cardsテーブル
- ユーザークレジットカードテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|card_number|integer|null:false|
|card_year|string|null: false|
|card_month|string|null: false|
|card_security|string|null: false|
### Association
- belongs_to :user

## itemsテーブル
- 商品テーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|text||
|price|integer|null:false|
|status|integer|default: 0|
|delivery_charge|integer||
|send_day|string||
|user_id|integer|null: false, foreign_key: true|
|item-image_id|integer|foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|size|string|null: false|
|delivery-method|string|null: false|
|prefecture_code|integer|null: false|
- prefecture_code:JpPrefecture,jquery.jpostal.jsを使用

### enum
- 商品ステータス
- status:{出品中:0,取引中:1,購入済み:2}

### Association
- has_many :comments
- has_many :purchases
- has_many :item-images
- belongs_to :category
- belongs_to :brand
- belongs_to :user

## categoriesテーブル
- カテゴリテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :items

## brandsテーブル
- ブランドテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items

## imagesテーブル
- 商品画像テーブル

|Column|Type|Options|
|------|----|-------|
|image|string||
|item_id|integer|null: false, foreign_key: true|
### Asociation
- belongs_to :item

## commentsテーブル
- コメントテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item


## purchasesテーブル
- 購入履歴テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item
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
- has_one  :card
- belongs_to :address

## addressesテーブル
- ユーザー住所テーブル

|Column|Type|Options|
|------|----|-------|
|user_id|intrger|null: false, foreign_key: true|
|post_code|integer|null: false|
|prefecture_code|integer|null: false|
|address_city|string|null: false|
|address_street|string|null: false|
|address_building|string|null: false|
### Association
- has_many :users

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
|size_id|integer|null: false, foreign_key: true|
|delivery_id|integer|null: false, foreign_key: true|
|prefecture_code|integer|null: false|
- prefecture_codeはJpPrefecture,jquery.jpostal.jsを使用

### enum
- 商品ステータス
- status:{出品中:0,取引中:1,購入済み:2}

### Association
- has_many :comments
- has_many :purchases
- has_many :item-images
- belongs_to :category
- belongs_to :brand
- belongs_to :delivery
- belongs_to :size
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

## sizesテーブル
- 商品サイズテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|null: false|

### Association
- has_many :items

## delivery-methodsテーブル
- 配送法テーブル

|Column|Type|Options|
|------|----|-------|
|d_method|string||

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
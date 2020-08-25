# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ER Diagram
![ER図](https://gyazo.com/8d4cf8316284eb356cdee1e4cfd26eef "サンプル")
https://gyazo.com/8d4cf8316284eb356cdee1e4cfd26eef


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|password|string|null: false, unique: true|
|email|string|null:false, unique: true|


# Association
- has_many :credits, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :items, through:  :favorites
- has_one :ship_address, dependent: :destroy



## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|user|references|null: false, foreign_key: true|

# Association
- has_many :items


## ship_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|post_code|integer(7)|null: false|
|pref(active_hash）|integer|null: false|
|city|string|null: false|
|address_detail|string|null: false|
|apartment_detail|string|
|phone_number|string|null:false, unique: true|
|user|references|null: false, foreign_key: true|


# Association
- belongs_to :user
- belongs_to_active_hash :pref



## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|customer_id|string|
|card_id|string|


# Association
- belongs_to :user



## items テーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|string|null: false|
|category|references|null: false, foreign_key: true|
|size|string|null: false|
|sale|integer|null: false|

# Association
- has_many :orders,
- has_many :images, dependent: :destroy
- has_many :orders, through:  :order_histories
- has_many :users, through:  :favorites
- has_one :color
- belongs_to :category


## orders テーブル
|Column|Type|Options|
|------|----|-------|
|delivery_method|string|null: false|
|postage|string|null: false|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|string|null: false|
|credit|references|null: false, foreign_key: true|
|user|references|null: false, foreign_key: true|
|ship_address|references|null: false, foreign_key: true|
|total_price|integer|null: false|

# Association
- has_many :items, through:  :order_histories


## order_histories テーブル
|Column|Type|Options|
|------|----|-------|
|order|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|count|integer|null: false|


# Association
- belongs_to :item
- belongs_to :order



## images テーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item|references|null: false, foreign_key: true|

# Association
- belongs_to :item



## favorites テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

# Association
- belongs_to :user
- belongs_to :item



## colorsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|item|references|null: false, foreign_key: true|

# Association
- has_one :item

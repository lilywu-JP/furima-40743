# README

# テーブル設計

## users テーブル
|Column                 |Type      |Options                            |
|nickname               |string    |null: false                        |
|email                  |string    |null: false, unique: true          |
|password               |string    |null: false                        |
|password_confirmation  |string    |null: false                        |
|last_name              |string    |null: false                        |
|first_name             |string    |null: false                        |
|last_name_kana         |string    |null: false                        |
|first_name_kana        |string    |null: false                        |
|birth_date             |string    |null: false                        |


### Association
has_many : items
has_many : orders

## items テーブル
|Column                  |Type      |Options                            |
|user_id                 |references|null: false, foreign_key: true     |
|item_image              |string    |null: false                        |
|item_name               |string    |null: false                        |
|item_info               |text      |null: false                        |
|items_detail            |text      |null: false                        |
|item_category           |string    |null: false                        |
|item_sales_status       |string    |null: false                        |
|item_shipping_fee_status|string    |null: false                        |
|item_prefecture         |string    |null: false                        |
|item_scheduled_delivery |string    |null: false                        |
|item_price              |string    |null: false                        |


### Association
belongs_to :user
has_one : order

## orders　　購入記録テーブル
|Column                 |Type       |Options                            |
|user_id                |references |null: false, foreign_key: true     |
|item_id                |references |null: false, foreign_key: true     |




### Association
belongs_to :user
belongs_to :item


## shipping_address　　　発送先情報テーブル
|Column                 |Type       |Options                           |
|user_id                |references |null: false, foreign_key: true    |
|item_id                |references |null: false, foreign_key: true    |
|postal_code            |string     |null: false                       |
|prefecture             |string     |null: false                       |
|city                   |string     |null: false                       |
|addresses              |text       |null: false                       |
|building               |string     |null: false                       |
|phone_number           |string     |null: false                       |


### Association2
has_one :order
belongs_to :user

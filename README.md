# README

# テーブル設計

## users テーブル
|Column                 |Type      |Options                            |
|nickname               |string    |null: false                        |
|email                  |string    |null: false, unique: true          |
|encrypted_password     |string    |null: false                        |
|last_name              |string    |null: false                        |
|first_name             |string    |null: false                        |
|last_name_kana         |string    |null: false                        |
|first_name_kana        |string    |null: false                        |
|birth_date             |date      |null: false                        |


### Association
has_many : items
has_many : orders

## items テーブル
|Column                  |Type      |Options                            |
|user                    |references|null: false, foreign_key: true     |
|item_name               |string    |null: false                        |
|item_info               |text      |null: false                        |
|items_detail            |text      |null: false                        |
|item_category           |string    |null: false                        |
|item_sales_status       |string    |null: false                        |
|item_shipping_fee_status|string    |null: false                        |
|prefecture              |integer   |null: false                        |
|item_scheduled_delivery |string    |null: false                        |
|item_price              |string    |null: false                        |


### Association
belongs_to :user
has_one : order

## orders　　購入記録テーブル
|Column                 |Type       |Options                            |
|user                   |references |null: false, foreign_key: true     |
|item                   |references |null: false, foreign_key: true     |




### Association
belongs_to :user
belongs_to :item


## shipping_address　　　発送先情報テーブル
|Column                 |Type       |Options                           |
|user                   |references |null: false, foreign_key: true    |
|item                   |references |null: false, foreign_key: true    |
|postal_code            |string     |null: false                       |
|prefecture             |integer    |null: false                       |
|city                   |string     |null: false                       |
|addresses              |string     |                                  |
|building               |string     |null: false                       |
|phone_number           |string     |null: false                       |


### Association
belongs_to :order
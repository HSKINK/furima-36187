# テーブル設計

## users テーブル

|Column             |Type   |Options    |
|-------------------|-------|-----------|
|nickname           |string |null: false|
|email              |string |null: false|
|encrypted_password |string |null: false|
|name               |string |null: false|
|name_kana          |string |null: false|
|birthday           |string |null: false|

### Association
- has_many :items
- has_many :histories

## items テーブル

|Column     |Type       |Options                        |
|-----------|-----------|-------------------------------|
|image      |           |null: false                    |
|product    |text       |null: false                    |
|description|text       |null: false                    |
|category   |string     |null: false                    |
|content    |string     |null: false                    |
|charge     |string     |null: false                    |
|area       |string     |null: false                    |
|ship       |string     |null: false                    |
|price      |string     |null: false                    |
|user_id    |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :history

## histories テーブル

|Column     |Type       |Options                        |
|-----------|-----------|-------------------------------|
|user_id    |references |null: false, foreign_key: true |
|item_id    |references |null: false, foreign_key: true |
|address_id |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

|Column       |Type   |Options    |
|-------------|-------|-----------|
|postal_code  |string |null: false|
|prefecture   |string |null: false|
|municipality |string |null: false|
|house_number |string |null: false|
|building_name|string |           |
|number       |string |null: false|

### Association
- has_many :histories

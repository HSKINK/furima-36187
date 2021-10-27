# テーブル設計

## users テーブル

|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|nickname           |string |null: false              |
|email              |string |null: false, unique: true|
|encrypted_password |string |null: false              |
|last_name          |string |null: false              |
|first_name         |string |null: false              |
|last_name_kana     |string |null: false              |
|first_name_kana    |string |null: false              |
|birthday           |date   |null: false              |

### Association
- has_many :items
- has_many :histories

## items テーブル

|Column     |Type       |Options                        |
|-----------|-----------|-------------------------------|
|product    |string     |null: false                    |
|description|text       |null: false                    |
|category_id|integer    |null: false                    |
|content_id |integer    |null: false                    |
|charge_id  |integer    |null: false                    |
|area_id    |integer    |null: false                    |
|ship_id    |integer    |null: false                    |
|price      |integer    |null: false                    |
|user       |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :history

## histories テーブル

|Column |Type       |Options                        |
|-------|-----------|-------------------------------|
|user   |references |null: false, foreign_key: true |
|item   |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

|Column           |Type     |Options                        |
|-----------------|---------|-------------------------------|
|postal_code      |string   |null: false                    |
|prefecture_id    |integer  |null: false                    |
|municipality     |string   |null: false                    |
|house_number     |string   |null: false                    |
|building_name    |string   |                               |
|telephone_number |string   |null: false                    |
|history          |reference|null: false, foreign_key: true |

### Association
- belongs_to :history

# テーブル設計

## users

|Column              |Type     |Options                         |
|--------------------|---------|--------------------------------|
| nickname           | string  | null: false                    |
| email              | string  | null: false, unique: true      |
| encrypted_password | string  | null: false                    |
| first_name_kanji   | string  | null: false                    |
| last_name_kanji    | string  | null: false                    |
| first_name_kana    | string  | null: false                    |
| last_name_kana     | string  | null: false                    |
| birth_date         | date    | null: false                    |


### Association
has_many: items
has_many: purchases


## items

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| item                | string     | null: false                    |
| comment             | text       | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| postage_type_id     | integer    | null: false                    |
| area_id             | integer    | null: false                    |
| preparation_days_id | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |


### Association
belongs_to: user
has_one: purchase
has_one_attached: image
belongs_to_active_hash: category
belongs_to_active_hash: status
belongs_to_active_hash: postage_type
belongs_to_active_hash: area
belongs_to_active_hash: preparation_days

## purchases

|Column   |Type        |Options                         |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item
has_one: address

## addresses

|Column          |Type        |Options                        |
|----------------|------------|-------------------------------|
| postal_code    | string     | null:false                    |
| area_id        | integer    | null:false                    |
| municipality   | string     | null:false                    |
| block          | string     | null:false                    |
| building       | string     |                               |
| phone_number   | string     | null:false                    |
| purchase       | references | null:false, foreign_key: true |

### Association
belongs_to: purchase
belongs_to_active_hash: area
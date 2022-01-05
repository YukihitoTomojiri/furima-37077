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
| years_id           | integer | null: false, foreign_key: true |
| months_id          | integer | null: false, foreign_key: true |
| days_id            | integer | null: false, foreign_key: true |

### Association
has_many: items
has_many: purchases
belongs_to_active_hash : years
belongs_to_active_hash : months
belongs_to_active_hash : days


## items

|Column               |Type        |Options                         |
|---------------------|------------|--------------------------------|
| item                | string     | null: false                    |
| comment             | text       | null: false                    |
| category_id         | integer    | null: false, foreign_key: true |
| status_id           | integer    | null: false, foreign_key: true |
| postage_type_id     | integer    | null: false, foreign_key: true |
| area_id             | integer    | null: false, foreign_key: true |
| preparation_days_id | integer    | null: false, foreign_key: true |
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
| purchases      | references | null:false, foreign_key: true |

### Association
belongs_to: purchase
belongs_to_active_hash: area
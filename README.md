# テーブル設計

## users

|Column              |Type    |Options                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name_kanji   | string | null: false               |
| last_name_kanji    | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |


### Association
has_many: items
has_many: purchases

## items

|Column                  |Type        |Options                         |
|------------------------|------------|--------------------------------|
| item                   | string     | null:false                     |
| comment                | text       | null:false                     |
| category               | string     | null:false                     |
| status                 | string     | null:false                     |
| price                  | integer    | null:false                     |
| delivery_charge_burden | string     | null:false                     |
| area                   | string     | null:false                     |
| days_up_to_delivery    | string     | null:false                     |
| user                   | references | null: false, foreign_key: true |


### Association
belongs_to: user
has_one: purchase
has_one_attached: image

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

|Column        |Type    |Options     |
|--------------|--------|------------|
| postal_code  | string | null:false |
| prefectures  | string | null:false |
| municipality | string | null:false |
| block        | string | null:false |
| building     | string | null:false |
| phone_number | string | null:false |

### Association
belongs_to: purchase
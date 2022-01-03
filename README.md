# テーブル設計

## users

|Column              |Type    |Options      |
|--------------------|--------|-------------|
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |


### Association
has_many: items
has_many: purchases

## items

|Column   |Type        |Options                         |
|---------|------------|--------------------------------|
|item     | string     |null:false                      |
|category | string     |null:false                      |
|price    | integer    |null:false                      |
|user     | references | null: false, foreign_key: true |


### Association
belongs_to: user
has_one: purchase

## purchases

|Column   |Type        |Options                         |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |
| address | references | null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: item
has_one: delivery

## addresses

|Column   |Type    |Options    |
|---------|--------|-----------|
| address | string |null:false |


### Association
belongs_to: purchase
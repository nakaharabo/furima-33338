# テーブル設計

## users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| encrypted_password      | string | null: false |
| email                   | string | null: false |
| last_name               | string | null: false |
| first_name              | string | null: false |
| last_name_kana          | string | null: false |
| first_name_kana         | string | null: false |
| birth_day               | date   | null: false |

### Association

- has_many :items
- has_many :buyers
- has_many :comments

## items テーブル

| Column           | Type       | Options           |
| ---------------- | -----------| ----------------- |
| name             | string     | null: false       |
| description      | text       | null: false       |
| category_id      | integer    | null: false       |
| state_id         | integer    | null: false       |
| delivery_fee_id  | integer    | null: false       |
| shipment_area_id | integer    | null: false       |
| shipment_day_id  | integer    | null: false       |
| price            | string     | null: false       |
| user             | references | foreign_key: true |
### Association

- belongs_to :user
- has_many :comments

## buyers テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| post_number     | string  | null: false |
| prefecture      | string  | null: false |
| city            | string  | null: false |
| address         | string  | null: false |
| building_name   | string  | null: false |
| phone_number    | integer | null: false |

### Association

- belongs_to :user


## comments テーブル

| Column      | Type       | Options                      |
| ----------- | ---------- | ---------------------------- |
| text        | text       | null: false                  |
| user        | references | foreign_key: true            |
| item        | references | foreign_key: true            |

### Association

- belongs_to :item
- belongs_to :user


## purchase_history テーブル

| Column | Type       | Options            |
| ------ | ---------- | ------------------ |
| user   | references | foreign_key: true  |
| items  | references | foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_many :buyers
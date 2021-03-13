# テーブル設計

## users テーブル

| Column                  | Type   | Options     |
| ----------------------- | ------ | ----------- |
| nickname                | string | null: false |
| password                | string | null: false |
| password_confirmation   | string | null: false |
| email                   | string | null: false |
| last_name               | string | null: false |
| first_name              | string | null: false |
| birth_day               | date   | null: false |

### Association

- has_many :items
- belongs_to :buyer
- has_many :comments

## items テーブル

| Column        | Type   | Options     |
| ------------- | -------| ----------- |
| image         | string | null: false |
| name          | string | null: false |
| description   | text   | null: false |
| category      | string | null: false |
| status        | string | null: false |
| delivery_fee  | string | null: false |
| shipment_area | string | null: false |
| shipment_day  | date   | null: false |
| price         | string | null: false |

### Association

- belongs_to :user
- has_many :comments

## buyers テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| card            | integer | null: false |
| expiration_date | integer | null: false |
| card_security   | integer | null: false |
| post_number     | integer | null: false |
| prefecture      | string  | null: false |
| city            | string  | null: false |
| address         | string  | null: false |
| building_name   | string  | null: false |
| phone_number    | integer | null: false |

### Association

- belongs_to :user


## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | text       | null: false |
| user        | references |             |
| items       | references |             |

### Association

- belongs_to :item
- belongs_to :user
# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_date         | date    | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column                     | Type       | Options                        |
|----------------------------|------------|--------------------------------|
| item_name                  | string     | null: false                    |
| item_info                  | text       | null: false                    |
| item_price                 | integer    | null: false                    |
| category_id                | integer    | null: false                    |
| sales_status_id            | integer    | null: false                    |
| shipping_fee_status_id     | integer    | null: false                    |
| prefecture_id              | integer    | null: false                    |
| item_scheduled_delivery_id | integer    | null: false                    |
| user                       | references | null: false, foreign_key: true |

### Association
- has_one :purchase
- belongs_to :user

## purchases テーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |

### Association
- has_one :shipping-address
- belongs_to :user
- belongs_to :item

## shipping_address テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
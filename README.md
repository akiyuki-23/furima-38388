# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last-name          | string  | null: false               |
| first-name         | string  | null: false               |
| last-name-kana     | string  | null: false               |
| first-name-kana    | string  | null: false               |
| birth-date         | date    | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column                     | Type       | Options                        |
|----------------------------|------------|--------------------------------|
| item-name                  | string     | null: false                    |
| item-info                  | text       | null: false                    |
| item-price                 | integer    | null: false                    |
| category_id                | integer    | null: false                    |
| sales-status_id            | integer    | null: false                    |
| shipping-fee-status_id     | integer    | null: false                    |
| prefecture_id              | integer    | null: false                    |
| item-scheduled-delivery_id | integer    | null: false                    |
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

## shipping addresses テーブル

| Column        | Type       | Options                        |
|---------------|------------|--------------------------------|
| postal-code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone-number  | string     | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
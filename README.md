# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column                     | Type       | Options                        |
|----------------------------|------------|--------------------------------|
| img                        | blob       | null: false                    |
| item-name                  | string     | null: false                    |
| item-info                  | text       | null: false                    |
| item-price                 | integer    | null: false                    |
| category                   | string     | null: false                    |
| sales-status               | string     | null: false                    |
| shipping-fee-status        | string     | null: false                    |
| item-prefecture            | string     | null: false                    |
| item-scheduled-delivery_id | string     | null: false                    |
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

|Column|Type|Options|
|------|----|-------|
| postal-code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| addresses    | string     | null: false                    |
| building     | string     | null: true                     |
| phone-number | integer    | null: false                    |
| purchase     | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
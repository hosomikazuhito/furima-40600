# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| birth              | string | null: false |

### Association

- has_many :goods
- has_many :Shipping


## goods テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| name               | string     | null: false                    |
| name_explanation   | string     | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| delivery           | string     | null: false                    |
| aria               | string     | null: false                    |
| days               | string     | null: false                    |
| price              | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| image              | string     | null: false                    |


### Association

- has_one :buys
- belongs_to :users


## Shipping テーブル

| Column           | Type           | Options                        |
| ------           | ----------     | ------------------------------ |
| post_code        | string         | null: false                    |
| prefectures      | string         | null: false                    |
| municipalities   | string         | null: false                    |
| street           | string         | null: false                    |
| building         | string         | null: false                    | 
| telephone        | string         | null: false                    |
| user_id          | references     | null: false, foreign_key: true |

### Association

- has_one :buys
- belongs_to :user

## buys テーブル

| Column  | Type           | Options                        |
| ------- | ----------     | ------------------------------ |
| name    | references     | null: false, foreign_key: true |
| buy     | references     | null: false, foreign_key: true |

### Association

- belongs_to :Shipping
- belongs_to :goods
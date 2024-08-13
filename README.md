# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| kana_last_name     | string | null: false |
| kana_first_name    | string | null: false |
| birth              | date   | null: false |

### Association

- has_many :goods
- has_many :sends


## goods テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| name               | string     | null: false                    |
| name_explanation   | text       | null: false                    |
| category           | string     | null: false                    |
| condition          | string     | null: false                    |
| delivery           | string     | null: false                    |
| aria               | string     | null: false                    |
| day_id             | integer    | null: false                    |
| price              | string     | null: false                    |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :users


## sends テーブル

| Column           | Type           | Options                        |
| ------           | ----------     | ------------------------------ |
| post_code        | string         | null: false                    |
| prefecture_id    | integer        | null: false                    |
| municipalities   | string         | null: false                    |
| street           | string         | null: false                    |
| building         | string         | null: false                    | 
| telephone        | string         | null: false                    |
| buys             | references     | null: false, foreign_key: true |

### Association

- 
- belongs_to :buys

## buys テーブル

| Column  | Type           | Options                        |
| ------- | ----------     | ------------------------------ |
| user    | references     | null: false, foreign_key: true |
| good    | references     | null: false, foreign_key: true |

### Association

- belongs_to :sends
- belongs_to :goods
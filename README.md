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
- has_many :buys


## goods テーブル

| Column             | Type       | Options                        |
| ------             | ------     | -----------                    |
| name               | string     | null: false                    |
| name_explanation   | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_id        | integer    | null: false                    |
| aria_id            | integer    | null: false                    |
| time_id            | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |



### Association

- belongs_to :user
  has_one :buys


## destinations テーブル

| Column           | Type           | Options                        |
| ------           | ----------     | ------------------------------ |
| post_code        | string         | null: false                    |
| aria_id          | integer        | null: false                    |
| municipalities   | string         | null: false                    |
| street           | string         | null: false                    |
| building         | string         |                                | 
| telephone        | string         | null: false                    |
| buy              | references     | null: false, foreign_key: true |

### Association

- 
- belongs_to :buy

## buys テーブル

| Column  | Type           | Options                        |
| ------- | ----------     | ------------------------------ |
| user    | references     | null: false, foreign_key: true |
| good    | references     | null: false, foreign_key: true |

### Association

- has_one :destination
- belongs_to :good
- belongs_to :user
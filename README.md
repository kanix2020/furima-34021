# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nick_name       | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :items
- has_many :sold_outs


## items テーブル

| Column           | Type      | Options                        |
| ---------------- | ------    | ------------------------------ |
| title            | text      | null: false                    |
| item_description | text      | null: false                    |
| price            | integer   | null: false                    |
| user             | reference | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one    :sold_out


## sold_outs テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- has_many :users
- has_many :items


## addresses テーブル

| Column       | Type      | Options                        |
| -----------  | --------- | ------------------------------ |
| postcode     | integer   | null: false                    |
| block        | text      | null: false                    |
| building     | text      | null: false                    |
| phone_number | integer   | null: false                    |
| user         | reference | null: false, foreign_key: true |

### Association
- belongs_to :sold_out
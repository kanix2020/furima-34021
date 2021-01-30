# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :orders


## items テーブル

| Column             | Type      | Options                        |
| ------------------ | ------    | ------------------------------ |
| title              | string    | null: false                    |
| description        | text      | null: false                    |
| category_id        | integer   | null: false                    |
| item_state_id      | integer   | null: false                    |
| delivery_price_id  | integer   | null: false                    |
| delivery_source_id | integer   | null: false                    |
| delivery_day_id    | integer   | null: false                    |
| price              | integer   | null: false                    |
| user_id            | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :order


## orders テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column         | Type      | Options                        |
| -------------- | --------- | ------------------------------ |
| postcode       | string    | null: false                    |
| city           | string    | null: false                    |
| block          | string    | null: false                    |
| building       | string    | null: false                    |
| phone_number   | string    | null: false                    |
| order_id       | reference | null: false, foreign_key: true |

### Association
- belongs_to :order

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kane     | string | null: false |
| profile            | string | null: false |
| birthday           | string | null: false |
| image              | string | null: false |

## items

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| price              | string | null: false |
| condition_id       | string | null: false |
| explanation        | string | null: false |
| size_id            | string | null: false |
| shipping_area_id   | string | null: false |
| shipping_price     | string | null: false |
| shipping_date      | string | null: false |
| shipping_method_id | string | null: false |
| user_id            | string | null: false |
| category_id        | string | null: false |
| brand_id           | string | null: false |
| user               | references | null: false, foreign_key: true |
| brands             | references | null: false, foreign_key: true |
| categories         | references | null: false, foreign_key: true |

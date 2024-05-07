# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル
| Column             | Type    | Options                   |
| -------------------| ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_kana         | string  | null: false               |
| last_kana          | string  | null: false               |
| birth_day          | data    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| price            | integer    | null: false                    |
| items_description| text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| postage_id       | integer    | null: false                    |
| region_id        | integer    | null: false                    |
| number_of_day_id | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :order_item

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | string     | null: false                    |
| prefectures  | string     | null: false                    | 
| city         | string     | null: false                    |
| house_number | string     | null: false                    |
| building_name| string     |                                | 
| tel          | string     | null: false                    |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true | 
### Association

- belongs_to :user
- has_many :order_items

## order_items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| order    | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |
| quantity | integer    | null: false                    |
| price    | integer    | null: false                    |
## Association

- belongs_to :item
- belongs_to :order
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
| Column               | Type    | Options                   |
| ---------------------| ------- | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| password             | string  | null: false               |
| password_confirmation| string  | null: false               |
| first_name           | string  | null: false               |
| last_name            | string  | null: false               |
| first_kana           | string  | null: false               |
| last_kana            | string  | null: false               |
| birth_year           | integer | null: false               |
| birth_month          | integer | null: false               |
| birth_day            | integer | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type    | Options                        |
| ---------------- | ------- | ------------------------------ |
| name             | string  | null: false                    |
| price            | integer | null: false                    |
| items_description| text    | null: false                    |
| category         | string  | null: false                    |
| condition        | string  | null: false                    |
| postage          | string  | null: false                    |
| region           | string  | null: false                    |
| number_of_day    | integer | null: false                    |
| user_id          | integer | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_one :order

## order テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| post_code    | string  | null: false                    |
| prefectures  | string  | null: false                    |
| city         | string  | null: false                    |
| house_number | integer | null: false                    |
| building_name| string  | null: false                    |
| tel          | string  | null: false                    |
| item_id      | integer | null: false, foreign_key: true |
| user_id      | integer | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item

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

## Tabel名

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |

### Association 
- has_many :orders
- has_many :items


## items テーブル

| Column            | Type      | Options                               |
| ------            | ------    | -----------                           |
 | user              | references| null: false, foreign_key: true        |
 | name              | string    | null: false                           |
 | description       | text      | null: false                           |
 | category_id       | integer   | null: false                           |
 | condition_id      | integer   | null: false                           |
 | shopping_cost_id  | integer   | null: false                           |
 | shopping_region_id| integer   | null: false                           |
 | shopping_day_id   | integer   | null: false                           |
 | price             | integer   | null: false                           |


### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column                | Type       | Options                        |
| ------                | ---------- | ------------------------------ |
| item                  | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :order_address

## order_addresses テーブル

| Column                | Type       | Options                        |
| -------               | ---------- | ------------------------------ |
| postal_code           | string     | null: false                    |
| shopping_region_id    | integer    | null: false                    |
| city                  | string     | null: false                    |
| street_address        | string     | null: false                    |
| building_name         | string     |                                |
| tel                   | string     | null: false                    |
| order                 | references | null: false, foreign_key: true |


### Association

- belongs_to :order

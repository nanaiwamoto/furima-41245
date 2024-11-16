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
| password           | string | null: false |
| lastname           | string | null: false |
| firstname          | string | null: false |
| lastknamekana      | string | null: false |
| firstnamekana      | string | null: false |
| birthdate          | string | null: false |

### Association ?
- has_many :oders
- has_many :items


## items テーブル

| Column           | Type   | Options     |
| ------           | ------ | ----------- |
| seller_id        | string | null: false |
| item_image       | string | null: false |
| item_name        | string | null: false |
| item_description | string | null: false |
| item_category    | string | null: false |
| item_condition   | string | null: false |
| shopping_cost    | string | null: false |
| shopping_region  | string | null: false |
| shopping_days    | string | null: false |
| price            | string | null: false |
| sales_fee        | string | null: false |
| profit           | string | null: false |


### Association

- belongs_to :user
- belongs_to :oder
- belongs_to :item

## orders テーブル

| Column                | Type       | Options                        |
| ------                | ---------- | ------------------------------ |
| item                  | string     | null: false |
| items_id              | string     | null: false |
| item_name             | string     | null: false |
| price                 | string     | null: false |
| payment_amount        | string     | null: false |
| shopping_cost         | string     | null: false |
| purchasedate          | string     | null: false |
| deliveryaddresses_id  | string     | null: false |


### Association

- belongs_to :user
- belongs_to :item
- belongs_to :delivery address

## deliveryaddresses テーブル

| Column                | Type       | Options                        |
| -------               | ---------- | ------------------------------ |
| postalcode            | string     | null: false |
| state                 | string     | null: false |
| city                  | string     | null: false |
| street_address        | string     | null: false |
| building_name         | string     | null: false |
| tel                   | string     | null: false |


### Association

- belongs_to :item
- belongs_to :oder

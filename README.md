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

# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| FirstNameCharacter | string  | null: false |
| LastNameCharacter  | string  | null: false |
| FirstNameKana      | string  | null: false |
| LastNameKana       | string  | null: false |
| BirthdayYear       | integer | null: false |
| BirthdayDay        | integer | null: false |
| BirthdayMonth      | integer | null: false |
### Association

- has_many :items
- has_many :purchasers

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| condition          | string     | null: false                    |
| image              | text       | null: false                    |
| describe           | text       | null: false                    | 
| category           | string     | null: false                    |
| ShippingFee        | string     | null: false                    |
| region             | string     | null: false                    |
| DeliveryDate       | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one    :purchaser

## purchasers テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| CreditCardNumber   | integer     | null: false                    |
| ValidMonth         | integer     | null: false                    |
| ValidYear          | integer     | null: false                    |
| SecurityCode       | integer     | null: false                    | 
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
### Association

- belongs_to :item
- belongs_to :user
- has_one    :address

## addresses テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| ZipCode            | integer     | null: false                    |
| prefecture         | string     | null: false                    |
| city               | string     | null: false                    |
| StreetNumber       | string     | null: false                    | 
| building           | string     |                                |
| PhoneNumber        | integer     | null: false                    |
| purchaser          | references | null: false, foreign_key: true |



### Association

- belongs_to :purchaser
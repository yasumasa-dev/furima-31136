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
| Column          | Type     | Options     |
|-----------------|----------|-------------|
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| first name      | string   | null: false |
| first name kana | string   | null: false |
| last name       | string   | null: false |
| last name kana  | string   | null: false |
| birth date      | datetime | null: false |

### Association
- has_many :items
- has_many :addresses


## items テーブル
| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| title  | string     | null: false                    |
| price  | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- has_many :users
- has_one  :address
- has_one  :purchase


## addresses テーブル
| Column       | Type       | Options                        |
|--------------|------------|--------------------------------|
| postal code  | string     | null: false                    |
| prefecture   | string     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     | null: false                    |
| phone number | string     | null: false                    |
| item         | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :item


## purchases テーブル
| Column | Type       | Options                        |
|--------|------------|--------------------------------|
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :item
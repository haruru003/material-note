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

* contents table

| column       | type   | option      |
| ------------ | ------ | ----------- |
| title        | string | null:false  |
| introduction | text   | null:false  |

- belongs_to :user


* illusts table
| column       | type       | option                        |
| ------------ | ---------- | ----------------------------- |
| title        | string     | null:false                    |
| introduction | text       | null:false                    |
| user         | references | null:false, foreign_key: true |

- belongs_to :user


* comics table
| column       | type       | option                        |
| ------------ | ---------- | ----------------------------- |
| title        | string     | null:false                    |
| introduction | text       | null:false                    |
| user         | references | null:false, foreign_key: true |

- belongs_to :user


* piyocomics
| column       | type       | option                        |
| ------------ | ---------- | ----------------------------- |
| title        | string     | null:false                    |
| introduction | text       | null:false                    |
| user         | references | null:false, foreign_key: true |

- belongs_to :user

* users
| column       | type   | option      |
| ------------ | ------ | ----------- |
| title        | string | null:false  |
| introduction | text   | null:false  |

- has_many :contents
- has_many :illusts
- has_many :comics
- has_many :piyocomics
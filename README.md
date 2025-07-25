# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
In psql

```SQL
CREATE ROLE rp_user WITH CREATEDB LOGIN PASSWORD 'rp_password';
```

Then

bin/rails db:create

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* Generating

```bash
rails generate model asset assetable_type:string assetable_id:integer name:string value:decimal notes:string location:string person:references
rails generate object_view:scaffold asset
rails generate model checking_account interest_rate:decimal
rails generate object_view:scaffold checking_account
```

rails generate model expense expenseable_type:string expenseable_id:integer name:string value:decimal notes:string location:string person:references
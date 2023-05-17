# RSPEC with sqlite on new rails project
## backtrace steps

ruby version ruby 3.0.5

gemfile have
```
gem "sqlite3", "~> 1.4"
gem 'rspec-rails'
```
```
bundle install
```

database.yml
```
default: &default
  adapter: sqlite3
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  timeout: 5000

test:
  <<: *default
  database: db/test.sqlite3
```

create Model and migration file and model spec
```
rails generate model Product name:string description:text
```

run migrations. in /db directory. a test.sqlite3 file is created. you can use a db client to connect to it.
```
rails db:migrate RAILS_ENV=test
```

sample /model/product_spec.rb file
```
require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject do
    product = Product.new
    product.name = 'new product'
    product.description = 'product description...'
    product
  end

  it 'tests for name' do
    expect(subject.name).to eql 'new product'
    expect(subject.description).to eql 'product description'
  end
end
```

run rspec. test should fail. intended.
```
bundle exec rspec
```

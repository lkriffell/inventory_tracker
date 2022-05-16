# Inventory Tracker
<img src="app/assets/images/Banner.png" alt="banner" max-width="600"><br>

![rails-badge](https://img.shields.io/badge/Rails-6.0.5-informational?style=flat-square) 
![ruby-badge](https://img.shields.io/badge/Ruby-2.5.1-informational?style=flat-square) ![closed-pr-badge](https://img.shields.io/github/issues-pr-closed-raw/lkriffell/inventory_tracker?style=flat-square)
[![Run on Repl.it](https://repl.it/badge/github/lkriffell/inventory_tracker)](https://repl.it/github/lkriffell/inventory_tracker)

# Local Setup
- Versions
  - Rails 6.0.5
  - Ruby 2.5.1
- Fork and clone the repository
- `cd` in your local repo version and run the following commands
  - To install gems:
    -  `bundle` (if this fails, try to `bundle update` and then retry)
  - To setup database:
    - `rails db:create`
    - `rails db:migrate`
    - `rails db:seed`
- Run your own development server:
  - `rails s`
  - [http://localhost:3000](http://localhost:3000)

# Database
<img src="app/assets/images/db_diagram.png" alt="diagram" max-width="100"><br>

# Test Suite
- Run with `bundle exec rspec`
- All tests should be passing
- 100% test coverage
Resourcefull
============
This uses a test-driven approach with both unit tests using [RSpec](http://rspec.info) and
feature tests using [Capybara](https://github.com/jnicklas/capybara) to create a
[Ruby on Rails](http://rubyonrails.org) web application.
​
​
​
Both [ActiveRecord](http://guides.rubyonrails.org/active_record_querying.html) and [PostgreSQL](http://www.postgresql.org) were used.
​
Program development used [Ishikawa Diagrams](https://www.mindtools.com/pages/article/newTMC_03.htm) and
followed the [Design Sprint](https://developers.google.com/design-sprint/?hl=en) process.
​
## Installation
​
1. The repository should be cloned and the directory changed into:
```
$ git clone git@github.com:allimac/resourcefull.git
$ cd resourcefull
```
​
2. Bundle run:
```
$ bundle
```
​
3. A database created and auto-migrate run:
```
$ createdb resourcefull_development
$ bin/rake db:migrate RAILS_ENV=development
```
Note: the `createdb` command assumes that [PostgreSQL](http://postgresapp.com) has been installed on the computer.
​
​
## Usage
​
To use the program, run rackup:
​
```
$ rackup
```
Then click the following link: [http://localhost:9292](http://localhost:9292)
​
## Problem Statement
​
The purpose of this website is to solve the following problem statement:
​
*I want to be able to access things quickly I only need for a short period of time, without spending any money and feel part of the community*
​
## Authors
​
* [Camilla Colombo Serri](https://github.com/allimac)
* [Katie Smith](https://github.com/klssmith)
* [Sara Tateno](https://github.com/saratateno)
* [Andrew Burnie](https://github.com/Andrew47)

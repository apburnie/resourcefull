Resourcefull
=============

![Resourcefull][public/logo.png]

* This uses a test-driven approach with both unit tests using [RSpec](http://rspec.info) and
feature tests using [Capybara](https://github.com/jnicklas/capybara) to create a
[Ruby on Rails](http://rubyonrails.org) web application.
​
* Both [ActiveRecord](http://guides.rubyonrails.org/active_record_querying.html) and [PostgreSQL](http://www.postgresql.org) were used.
​
* Program development used [Ishikawa Diagrams](https://www.mindtools.com/pages/article/newTMC_03.htm) and
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

4. Install Homebrew and then use this to install ImageMagick:
```
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew install imagemagick --build-from-source
```
​
## Usage
​
To use the program, run following:
​
```
$ rails s
```
Then click the following link: [http://localhost:9292](http://localhost:9292)

##User Flow

* The homepage displays the books in the library.

* Click the SIGN UP link in the top right to sign up, then enter your name and email address to sign up.

* Alternatively, existing users can click LOG IN, and log in using their email and password.

* Users can then request books that they are interested in, by clicking the REQUEST link under the desired book.

* If a user has received a request, then they will receive a message "You have requests pending. Manage requests". They can click the 'Manage requests' link.

* This takes the user to their borrowings page.

* Here they can click 'Decline' to reject.

* If an item has been transferred, then they can click 'Yup, item transferred!'

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

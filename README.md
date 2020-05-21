# Cashback

Welcome to my Cashback project, you can see it working in heroku through [here](https://secret-reaches-99824.herokuapp.com/)

## Setup

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.0](https://github.com/organization/project-name/blob/master/.ruby-version#L1)
- Rails [ 6.0.3](https://github.com/organization/project-name/blob/master/Gemfile#L12)
- psql (PostgreSQL) 10.12

##### 1. Check out the repository

```bash
git clone git@github.com:Emerick94/Cashback.git
```

##### 2. Create database.yml file

Copy the sample database.yml file and edit the database configuration as required.

```bash
cp config/database.yml.sample config/database.yml
```

##### 3. Create and setup the database

Run the following commands to create and setup the database.

```
bundle install
bundle exec rake db:create
bundle exec rake db:setup
```

##### 4. This updates your local cron for automatic status switch

```
whenever --update-crontab --set environment=development
```

##### 5. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```
And now you can visit the site with the URL http://localhost:3000

## Observations

Here you can read about some of what I did that wasn't part of the test requirements.
  - small visual improvements to the admin interface (using bootstrap tables).

  - Validations on rails and on the database, as a good practice.

  - Authentication, it has a secure password using bcrypt.
  No page requires a user to be logged in

  - the front has a counter that shows how many, if any, users clicked on an offer.

  - flash messages showing errors when need and confirming user loggin.
  Javascript to close those flash messages not implemented

  - Simple navbar showing a home, username if logged in, showing Log In and Sign Up options if not.

  - Database system change from sqlite to psql, since psql is more robust, and works with heroku.
  It's good practice to use the same database system for development and production

  - Logs, so I know how many offers have beem enabled/disabled in each hour.

  - Join table create explicitely, with a model and validations, as a good practice.

  - Deploy on heroku.
  [Take me there](https://secret-reaches-99824.herokuapp.com/)
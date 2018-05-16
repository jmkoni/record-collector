# Record Collector

This application helps users keep track of records in their collection. As it is right now, it will only function for a single user.

### Ruby version
This application uses Ruby 2.5.1, as specified in the `.ruby-version` file. If you already have that installed, as soon as you `cd` into this directory, RVM will create a gemset with that ruby version.

### Install dependencies

Once you have Ruby installed and are on the correct gemset (`record-collector`), install the required ruby gems by doing the following:

    gem install bundler
    bundle install

### Database creation and initialization

The database used in this project is sqlite, which should already be on your computer. To initialize the database, run:
    
    rails db:setup

This will create your required databases and add some seed data.

### Starting the application

To start the server, run:

    rails s

You can leave this server running while you develop. You need only restart the
server when you make changes to anything in the `config` or `db` directories.

### How to run the test suite

To run the test suite, run:

    bundle exec rspec

This will run your test suite and generate files in `/coverage`.

### Deployment instructions

TODO: not currently deployed

### Future todos:
Add Devise and have users own albums.


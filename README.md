## Rails Base
Rails Base is a template for generate a basic Rails app with the main gems.

## Prerequisites
- Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)

This is using:
- Ruby 3.2.2
- Rails 7.0.6
- Postgres


## Configuration

1. As optional, modify the following line to change the database name in the `config/database.yml` file by environment:
``` yaml
  database: rails_base...
```

## Set up & Run
- Inside the projec folder:
- You can run `make` or `make help` to see all the options.

1. Run `make build`
1. For development mode, It´s necessary to enter in the container with the next command `make devshell`
1. Inside the container run the command for create the database: `bundle exec rake db:setup`
1. Run the app `bundle exec rails server -b 0.0.0.0 -p 3000`
1. You can now try your REST services! visiting http://localhost/api/v1/ping 
- Notice: In the machine the app run in port 80 by default, this configuration is set in `docker-compose.yml` file

## Gems
- [Annotate](https://github.com/ctran/annotate_models) for doc the schema in the classes
- [Byebug](https://github.com/deivid-rodriguez/byebug) for debugging
- [Factory Bot](https://github.com/thoughtbot/factory_bot) for testing data
- [Faker](https://github.com/stympy/faker) for generating test data
- [Jbuilder](https://github.com/rails/jbuilder) for json views
- [Rubocop](https://github.com/bbatsov/rubocop/) for ruby linting
- [Rswag](https://github.com/rswag/rswag) for document endpoints and rspec integrated

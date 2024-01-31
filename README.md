## Rails Base
Rails Base is a template for generate a basic Rails app with the some gems installed.

## Prerequisites
- Have `docker` and `docker-compose` installed (You can check this by doing `docker -v` and `docker-compose -v`)

This is using:
- Ruby 3.2.2
- Rails 7.0.6
- Postgres


## Configuration

- As optional, modify the following line to change the database name in the `config/database.yml` file by environment:
``` yaml
  database: rails_base...
```

## Credentials
- In `envs/postgres.env` set the credentials for postgres
- In file `.env` set the host for swagger, docker and rails environments

## Set up & Run
- Inside the projec folder:
- `make` to see all the options of Makefile.

1. `make build` to create the containers
1. `make dev` for development mode, It´s necessary to enter in the container with this command.
1. `rake db:setup`, Inside the container run the command for create the database
1. `bundle exec rails server -b 0.0.0.0 -p 3000` Run the app
1. You can now try your REST services! visiting http://localhost/api/v1/ping 
- Notice: In the machine the app run in port 80 by default, this configuration is set in `docker-compose.yml` file

- You can see if the docker container is running as development or production running the command `env` inside the container with the value of variable `ENV_NAME`

## Gems
- [Annotate](https://github.com/ctran/annotate_models) for doc the schema in the classes
- [Byebug](https://github.com/deivid-rodriguez/byebug) for debugging
- [Factory Bot](https://github.com/thoughtbot/factory_bot) for testing data
- [Ffaker](https://github.com/ffaker/ffaker) for generating test data
- [Jbuilder](https://github.com/rails/jbuilder) for json views
- [Rubocop](https://github.com/bbatsov/rubocop/) for ruby linting
- [Rswag](https://github.com/rswag/rswag) for document endpoints and rspec integrated
- [Simplecov](https://github.com/simplecov-ruby/simplecov) for code coverage

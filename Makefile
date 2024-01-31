.DEFAULT_GOAL := help
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

ifndef SERVICE
SERVICE=rails_base
endif

######### Docker compose commands #########
build: ## Build the containers
	@docker compose build

up: ## Start the containers
	@rm -f tmp/pids/server.pid
	@docker compose up

stop: ## Stop the containers
	@docker compose stop

down: ## Remove the containers
	@docker compose down

######### Rails app commands (development and test modes) #########
console: ## Rails console on development mode
	@docker compose run \
		--rm \
		--env RAILS_ENV=development \
		--entrypoint "bundle exec rails console" \
		$(SERVICE)

check: ## Run checks (checks must be clean) development mode
	@docker compose run \
	  --rm \
		--env RAILS_ENV=development \
		--entrypoint "bundle exec rubocop" \
		$(SERVICE)

check-a: ## Run checks and autocorrectable (checks must be clean) development mode
	@docker compose run \
	  --rm \
		--env RAILS_ENV=development \
		--entrypoint "bundle exec rubocop -A" \
		$(SERVICE)

dev: ## Shell for Rails only on development mode
	@docker compose run \
		--env RAILS_ENV=development \
		--entrypoint bash \
		--rm \
		--service-ports \
		$(SERVICE)

psql: ## Postgresql console development mode
	@docker compose run \
		--env PGPASSWORD=admin \
		postgres_db \
		psql -h postgres_db -U admin rails_base_development

rspec: ## Rspec in test mode
	@docker compose run \
		--env RAILS_ENV=test \
		--entrypoint "bundle exec rspec" \
		$(SERVICE)

rswag: ## Swagger documentation with rspec in development mode
	@docker compose run \
		--rm \
		--env RAILS_ENV=development \
		--entrypoint "bundle exec rails rswag" \
		$(SERVICE)


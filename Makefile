all: help

help:
	@echo ""
	@echo "--[HELP]----------------------------------------------------------------------"
	@echo ""
	@echo " make build                                      # Build the containers"
	@echo " make down                                       # Stop the containers"
	@echo " make help                                       # Show this help"
	@echo " make [SERVICE=<rails_base>] devshell         # Start a shell the container"
	@echo " make psql                                       # Start a psql shell"
	@echo " make up                                         # Start the containers"
	@echo ""
	@echo "------------------------------------------------------------------------------"

ifndef SERVICE
SERVICE=rails_base
endif

build:
	@docker compose build

db-create:
	@docker compose run \
		--rm \
		--env RAILS_ENV=development \
		--entrypoint "bundle exec rake db:create" \
		$(SERVICE)

devshell:
	@docker compose run \
		--env RAILS_ENV=development \
		--entrypoint bash \
		--rm \
		--service-ports $(SERVICE)

down:
	@docker compose down

psql:
	@docker compose run \
		--env PGPASSWORD=admin \
		pg_db \
		psql -h pg_db -U admin rails_base_development

up:
	@docker compose up
savedb:
	@echo "Saving current database state"; \
	pg_dump -Fc cr_tier_list_db > db_seed.dump

loadseedsfile:
	@echo "Dropping cr_tier_list_db if exists..."; \
	dropdb cr_tier_list_db --if-exists
	@echo "Creating clean cr_tier_list_db..."; \
	createdb cr_tier_list_db
	rake db:seed & bundle exec rails s

backend:
	@echo "Dropping cr_tier_list_db if exists..."; \
	dropdb cr_tier_list_db --if-exists
	@echo "Creating clean cr_tier_list_db..."; \
	createdb cr_tier_list_db
	@echo "Restoring last saved database state..."; \
	pg_restore --verbose --clean --no-acl --no-owner -h localhost -U root -d cr_tier_list_db db_seed.dump &
	bundle exec rails s

test:
	bundle exec rspec

# Staging commands
staging:
	git push staging master
	heroku run rake db:migrate -r staging

savestagingdb:
	heroku pg:backups capture -r staging
	curl -o db_staging.dump `heroku pg:backups public-url -r staging`

loadstaging:
	dropdb cr_tier_list_db_staging --if-exists
	createdb cr_tier_list_db_staging
	pg_restore --verbose --clean --no-acl --no-owner -h localhost -U root -d cr_tier_list_db_staging db_staging.dump

# Production commands
prod:
	git push prod master
	heroku run rake db:migrate -r prod

saveproddb:
	heroku pg:backups capture -r prod
	curl -o db_prod.dump `heroku pg:backups public-url -r prod`

loadprod:
	dropdb cr_tier_list_db_prod --if-exists
	createdb cr_tier_list_db_prod
	pg_restore --verbose --clean --no-acl --no-owner -h localhost -U root -d cr_tier_list_db_prod db_prod.dump

.PHONY: help

install:
	@pip install -r requirements.txt
	@bundle install --binstubs

build:
	@bundle exec rake build

serve: build
	@bundle exec guard start

deploy: clean build
	@bundle exec rake deploy

clean:
	@bundle exec rake clean

help:
	@echo "Tasks for my site:"
	@echo "build  - Gets dependencies and builds site."
	@echo "serve  - Spins up a local Web server serving the built site."
	@echo "deploy - Sends the site to my Web server."
	@echo "clean  - Wipes up the local development environment."


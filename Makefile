.PHONY: all help install build serve deploy clean

all: help

install:
	@pip install -r requirements.txt
	@bundle install --binstubs

build:
	@bundle exec rake build

build-deploy:
	@bundle exec rake build:deploy

serve: build
	@bundle exec guard start

deploy: clean-deploy build-deploy
	@bundle exec rake deploy

clean:
	@bundle exec rake clean
	@bundle exec jekyll clean

clean-deploy: clean
	@rm -rf _deploy

help:
	@echo "Tasks for my site:"
	@echo "build  - Gets dependencies and builds site."
	@echo "serve  - Spins up a local Web server serving the built site."
	@echo "deploy - Sends the site to my Web server."
	@echo "clean  - Wipes up the local development environment."

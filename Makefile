.PHONY: all help install build serve deploy clean

all: help

install:
	@pip install -r requirements.txt
	@bundle install --binstubs

build:
	@bundle exec rake build

serve: build
	@bundle exec guard start

clean:
	@bundle exec rake clean
	@bundle exec jekyll clean

deploy: clean-deploy build-deploy upload-deploy

build-deploy:
	@bundle exec rake build:deploy

clean-deploy: clean
	@rm -rf _deploy

upload-deploy:
	@bundle exec rake deploy

setup-deploy:
	@bundle exec mina setup

help:
	@echo "Tasks for my site:"
	@echo "build  - Gets dependencies and builds site."
	@echo "serve  - Spins up a local Web server serving the built site."
	@echo "deploy - Sends the site to my Web server."
	@echo "clean  - Wipes up the local development environment."

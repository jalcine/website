.PHONY: all build serve
BUNDLE_EXEC=bundle exec
JALCINE_PORT?=1993

all: help

help:
	@echo "build: Compile the website."
	@echo "serve: Serve up the site."

build-theme:
	@cd themes/maple && npm run webpack
	@bundle install

build-site:
	@$(BUNDLE_EXEC) jekyll build

build: build-theme build-site

serve: build-theme
	@$(BUNDLE_EXEC) jekyll server --port $(JALCINE_PORT)

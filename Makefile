.PHONY: all build
BUNDLE_EXEC=bundle exec
JALCINE_PORT?=1993

all: help

help:
	@echo "build: Compile the website."

build:
	@cd themes/maple && npm run webpack
	@bundle install
	@$(BUNDLE_EXEC) jekyll build

serve:
	@$(BUNDLE_EXEC) jekyll server --port $(JALCINE_PORT)

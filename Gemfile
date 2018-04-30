# vim:set fdl=1 nospell:
# frozen_string_literal: true

source 'https://rubygems.org'

# {{{ Core Utilities
gem 'bundler'
gem 'dotenv'
gem 'rake'
# }}}

group :jekyll do
  gem 'activesupport'
  gem 'autoprefixer-rails'
  gem 'classifier-reborn'
  gem 'execjs'
  gem 'image_optim'
  gem 'jekyll'
  gem 'kramdown'
  gem 'mini_magick'
  gem 'parallel'
  gem 'rouge'
  gem 'sprockets', '~> 4.0.0.beta7'
  gem 'uglifier'
  gem 'xmlrpc'
end

group :jekyll_plugins do
  gem 'jekyll-assets'
  gem 'jekyll-feed'
  gem 'jekyll-gist'
  gem 'jekyll-paginate-v2'
  gem 'jekyll-redirect-from'
  gem 'jekyll-sitemap'
  gem 'jekyll-tagging'
  gem 'jekyll-tagging-related_posts'
  gem 'jekyll-tidy'
  gem 'jekyll-twitter-plugin'
  gem 'jekyll-typogrify'
  gem 'jekyll-webmention_io'
  gem 'jemoji'
  gem 'ruby-oembed'
end

# {{{ Development
# Local web server
group :web do
  gem 'haml'
  gem 'puma'
  gem 'rack'
  gem 'rack-livereload', require: 'rack/livereload', group: :development
end

# Automation
group :development do
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rack', require: false
  gem 'guard-rake', require: false
  gem 'guard-rspec', require: false
  gem 'libnotify'
end

group :test do
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'chromedriver-helper'
  gem 'html-proofer'
  gem 'rspec'
  gem 'selenium-webdriver'
end
# }}}

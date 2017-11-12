# vim:set fdl=1 nospell:
# frozen_string_literal: true

source 'https://rubygems.org'

# {{{ Core Utilities
gem 'dotenv'
gem 'rake'
# }}}

group :jekyll do
  gem 'autoprefixer-rails'
  gem 'classifier-reborn'
  gem 'jekyll', '~> 3.5'
  gem 'kramdown'
  gem 'mini_magick'
  gem 'rb-gsl'
  gem 'rouge'
  gem 'rack-jekyll'
  gem 'sprockets', '~> 3.7'
  gem 'activesupport'
end

group :jekyll_plugins do
  gem 'jekyll-analytics'
  gem 'jekyll-assets', '~> 2.4.0'
  gem 'jekyll-autolink_email'
  gem 'jekyll-email-protect'
  gem 'jekyll-feed'
  gem 'jekyll-gist'
  gem 'jekyll-redirect-from'
  gem 'jekyll-sitemap'
  gem 'jekyll-tagging'
  gem 'jekyll-tagging-related_posts'
  gem 'jekyll-timeago'
  gem 'jekyll-twitter-plugin'
  gem 'jekyll-typogrify'
  gem 'jekyll-webmention_io'
  gem 'jekyll_version_plugin'
  gem 'jemoji'
end

# {{{ Development
# Local web server
group :web do
  gem 'haml'
  gem 'puma'
  gem 'rack'
  gem 'rack-livereload', require: 'rack/livereload'
end

group :deployment do
  gem 'mina', '< 1.0.0'
  gem 'mina-scp'
end

# Automation
group :guard do
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rack', require: false
  gem 'guard-rake', require: false
  gem 'guard-rspec', require: false
  gem 'libnotify'
end
# }}}

group :test do
  gem 'capybara'
  # gem 'capybara-accessible'
  gem 'capybara-puma'
  gem 'capybara-screenshot'
  gem 'chromedriver-helper'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
  gem 'rspec'
  gem 'html-proofer'
end

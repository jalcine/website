# vim:set fdl=1 nospell:
# frozen_string_literal: true

source 'https://rubygems.org'

# {{{ Core Utilities
gem 'dotenv'
gem 'rake'
gem 'rake-jekyll'
# }}}

group :jekyll do
  gem 'autoprefixer-rails'
  gem 'classifier-reborn'
  gem 'jekyll', '3.6.0'
  gem 'kramdown'
  gem 'mini_magick'
  gem 'rb-gsl'
  gem 'rouge'
  gem 'sprockets-es6'
  gem 'twitter_web_intents'
end

group :jekyll_plugins do
  # gem 'amp-jekyll'
  gem 'jekyll-analytics'
  gem 'jekyll-asciinema'
  gem 'jekyll-assets'
  gem 'jekyll-autolink_email'
  gem 'jekyll-email-protect'
  gem 'jekyll-feed'
  gem 'jekyll-gist'
  gem 'jekyll-money'
  gem 'jekyll-redirect-from'
  gem 'jekyll-responsive-image'
  gem 'jekyll-sass-converter'
  gem 'jekyll-sitemap'
  gem 'jekyll-tagging-related_posts'
  gem 'jekyll-textile-converter'
  gem 'jekyll-timeago'
  gem 'jekyll-twitter-plugin'
  gem 'jekyll-typogrify'
  # gem 'jekyll-webmention_io'
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
  gem 'sass'
  gem 'susy'
end

group :deployment do
  gem 'mina', '< 1.0.0'
  gem 'mina-scp'
end

# Automation
group :guard do
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-jekyll-plus', git: 'https://github.com/imathis/guard-jekyll-plus',
                           require: false
  gem 'guard-livereload', require: false
  gem 'guard-npm', require: false
  gem 'guard-rack', require: false
  gem 'guard-rspec', require: true
  gem 'libnotify'
end
# }}}

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'capybara-puma'
  gem 'capybara-accessible'
  gem 'chromedriver-helper'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'
end

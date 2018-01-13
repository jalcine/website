# vim:set fdl=1 nospell:
# frozen_string_literal: true

source 'https://rubygems.org'

# {{{ Core Utilities
gem 'dotenv'
gem 'rake'
# }}}

group :jekyll do
  gem 'activesupport'
  gem 'autoprefixer-rails'
  gem 'classifier-reborn'
  gem 'jekyll', '3.5.2'
  gem 'kramdown'
  gem 'mini_magick'
  gem 'rack-jekyll'
  gem 'rb-gsl'
  gem 'rouge'
  gem 'sprockets', '~> 3.7'
  gem 'execjs'
end

group :jekyll_plugins do
  gem 'jekyll-analytics'
  gem 'jekyll-assets', '~> 2.4.0'
  gem 'jekyll-email-protect'
  gem 'jekyll-feed'
  gem 'jekyll-gist'
  gem 'jekyll-redirect-from'
  gem 'jekyll-sitemap'
  gem 'jekyll-tagging'
  gem 'jekyll-tagging-related_posts'
  gem 'jekyll-twitter-plugin'
  gem 'jekyll-typogrify'
  gem 'jekyll-webmention_io'
  gem 'jekyll_version_plugin'
  gem 'jemoji'
  gem 'ruby-oembed'
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

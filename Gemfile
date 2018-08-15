# vim:set fdl=1 nospell:
# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.0'

# {{{ Core Utilities
gem 'dotenv'
gem 'rake'
# }}}

group :jekyll do
  gem 'activesupport'
  gem 'autoprefixer-rails'
  gem 'classifier-reborn'
  gem 'jekyll'
  gem 'kramdown'
  gem 'parallel'
  gem 'rouge'
  gem 'sprockets', '~> 4.0.0.beta7'
  gem 'xmlrpc'
end

group :jekyll_plugins do
  gem 'jekyll-assets'
  gem 'jekyll-feed'
  gem 'jekyll-json-feed'
  gem 'jekyll-gist'
  gem 'jekyll-include-cache'
  gem 'jekyll-paginate-v2'
  gem 'jekyll-redirect-from'
  gem 'jekyll-sitemap'
  gem 'jekyll-tagging'
  gem 'jekyll-tagging-related_posts'
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
  gem 'libnotify', require: false
end
# }}}

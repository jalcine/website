# vim: set fdl=1 nospell:
# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.4.0'

# {{{ Core Utilities
gem 'dotenv'
gem 'rake'
# }}}

group :jekyll do
  gem 'jekyll', '~> 3.8.0'
  gem 'parallel'
  gem 'xmlrpc'
end

group :jekyll_plugins do
  gem 'activesupport'
  gem 'autoprefixer-rails'
  gem 'classifier-reborn'
  gem 'jekyll-assets'
  gem 'jekyll-feed'
  gem 'jekyll-gist'
  gem 'jekyll-include-cache'
  gem 'jekyll-json-feed'
  gem 'jekyll-paginate-v2'
  gem 'jekyll-redirect-from'
  gem 'jekyll-sitemap'
  gem 'jekyll-tagging'
  gem 'jekyll-tagging-related_posts'
  gem 'jekyll-typogrify'
  gem 'jekyll-webmention_io'
  gem 'jemoji'
  gem 'kramdown'
  gem 'rouge'
  gem 'ruby-oembed'
  gem 'sprockets', '~> 4.0.0.beta7'
end

# {{{ Development
# Local web server
group :web do
  gem 'haml'
  gem 'puma'
  gem 'rack'
  gem 'rack-livereload', require: 'rack/livereload', group: :development
end
# }}}

group :development do
  gem 'rubocop'
end

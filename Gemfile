# vim:set fdl=0 nospell:
source 'https://rubygems.org'

# {{{ Core Utilities
gem 'dotenv'
gem 'jekyll'
# }}}

group :jekyll do
  gem 'redcarpet'
  gem 'rb-gsl'
  gem 'jemoji'
  gem 'jekyll-gist'
  gem 'jekyll-sass'
  gem 'jekyll-haml'
  gem 'jekyll-tagging'
  gem 'jekyll-compose'
  gem 'jekyll-timeago'
  gem 'jekyll-git_metadata'
  gem 'jekyll-twitter-plugin'
  gem 'jekyll-auto-image'
end

# {{{ Development
# Local web server
group :web do
  gem 'rack'
  gem 'rack-livereload'
  gem 'sass'
  gem 'haml'
end

# Automation
group :guard do
  gem 'guard'
  gem 'guard-jekyll-plus', '2.0.0', require: false
  gem 'guard-rack', require: false
  gem 'guard-bundler', require: false
  gem 'guard-livereload', require: false
  gem 'guard-cucumber', require: false
end
# }}}

group :test do
  gem 'rspec-expectations'
  gem 'cucumber'
  gem 'poltergeist'
end

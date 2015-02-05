# vim: set fdl=0 nospell:
source 'https://rubygems.org'
ruby '2.1.3'

# {{{ Core Utilities
gem 'sass'
gem 'haml'
gem 'dotenv'
# }}}

# {{{ Jekyll
gem 'jekyll'
gem 'jekyll-gist'
gem 'jekyll-sass'
gem 'jekyll-haml'
gem 'jemoji'
gem 'jekyll-tagging'
gem 'jekyll-compose'
# }}}

group :development do
  # Local web server
  gem 'rack'
  gem 'rack-livereload'

  # Automation
  gem 'guard'
  gem 'guard-jekyll-plus'
  gem 'guard-rack'
  gem 'guard-bundler'
  gem 'guard-livereload'
end

# {{{ Deployment
group :deployment do
  gem 'capistrano'
  gem 'capistrano-nginx'
  gem 'capistrano-bundler'
end
# }}}

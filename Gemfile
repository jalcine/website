# vim:set fdl=-1 nospell:
source 'https://rubygems.org'

# {{{ Core Utilities
gem 'dotenv'
gem 'rake'
gem 'rake-jekyll'
# }}}

group :jekyll do
  gem 'jekyll'
  gem 'kramdown'
  gem 'rb-gsl'
end

group :jekyll_plugins do
  gem 'jemoji'
  gem 'jekyll-gist'
  gem 'jekyll-sass'
  gem 'jekyll-haml'
  gem 'jekyll-tagging'
  gem 'jekyll-compose'
  gem 'jekyll-timeago'
  gem 'jekyll-git_metadata'
  gem 'jekyll-twitter-plugin'
  gem 'jekyll-auto-image', '1.0.2'
  gem 'octopress-quote-tag'
  gem 'octopress-video-tag'
end

# {{{ Development
# Local web server
group :web do
  gem 'rack'
  gem 'puma'
  gem 'rack-livereload', require: 'rack/livereload'
  gem 'sass'
  gem 'haml'
  gem 'susy'
end

group :deployment do
  gem 'mina'
  gem 'mina-scp'
end

# Automation
group :guard do
  gem 'guard'
  gem 'guard-jekyll-plus', '2.0.0', require: false
  gem 'guard-rack', require: false
  gem 'guard-bundler', require: false
  gem 'guard-livereload', require: false
end
# }}}

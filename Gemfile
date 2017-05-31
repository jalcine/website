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
  gem 'jekyll'
  gem 'jekyll-tagging-related_posts'
  gem 'kramdown'
  gem 'mini_magick'
  gem 'rb-gsl'
end

group :jekyll_plugins do
  gem 'jekyll-assets', git: 'https://github.com/jekyll/jekyll-assets'
  gem 'jekyll-gist'
  gem 'jekyll-sass-converter'
  gem 'jekyll-sitemap', git: 'https://github.com/jekyll/jekyll-sitemap'
  gem 'jekyll-timeago'
  gem 'jekyll-twitter-plugin'
  gem 'jemoji'
  gem 'octopress-quote-tag'
  gem 'octopress-video-tag', git: 'https://github.com/anarchivist/octopress-video-tag',
                             branch: 'loosen-gemspec'
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
end
# }}}

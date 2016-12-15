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
  gem 'sprockets-es6'
  gem 'autoprefixer-rails'
  gem 'mini_magick'
  gem 'jekyll-tagging-related_posts'
end

group :jekyll_plugins do
  gem 'jekyll-gist'
  # gem 'jekyll-sass-converter'
  # gem 'jekyll-timeago'
  gem 'jekyll-twitter-plugin'
  gem 'jemoji'
  gem 'octopress-quote-tag'
  gem 'octopress-video-tag', git: 'https://github.com/anarchivist/octopress-video-tag',
    branch: 'loosen-gemspec'
  gem 'jekyll-assets', github: 'jekyll/jekyll-assets'
  gem 'jekyll-sitemap', github: 'jekyll/jekyll-sitemap'
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
  gem 'guard-jekyll-plus', require: false, github: 'imathis/guard-jekyll-plus'
  gem 'guard-rack', require: false
  gem 'guard-bundler', require: false
  gem 'guard-livereload', require: false
  gem 'guard-npm', require: false
end
# }}}

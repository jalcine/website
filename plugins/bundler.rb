require 'rubygems'
require 'bundler/setup'
require 'dotenv'

Bundler.require(:jekyll_plugins)
Dotenv.load
Bundler.require(:jekyll)
require 'tilt/redcarpet'

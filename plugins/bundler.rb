require 'rubygems'
require 'bundler/setup'
require 'dotenv'

Bundler.require(:jekyll, :jekyll_plugins)
Dotenv.load
Bundler.require(:jekyll)

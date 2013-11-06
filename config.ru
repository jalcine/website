require 'rubygems'
require 'bundler/setup'
require 'rack/contrib/try_static'
require 'rack/contrib/locale'
Bundler.require(:default)

use Rack::ETag
use Rack::Locale
use Rack::LiveReload, vendored: false

run Rack::Directory.new('_site')

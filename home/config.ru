require 'rubygems'
require 'middleman/rack'

use Rack::LiveReload
run Middleman.server

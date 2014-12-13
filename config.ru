require 'rack/livereload'

use Rack::LiveReload
use Rack::Static, urls: [/\/$/], root: "_site", index: 'index.html'
run Rack::File.new('_site')

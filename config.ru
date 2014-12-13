require 'rack/livereload'

use Rack::LiveReload, source: :livereload, no_swf: true
use Rack::Static, urls: [/^\/*/], root: "_site"
run Rack::File.new('_site')

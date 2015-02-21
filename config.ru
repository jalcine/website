require 'rack/livereload'

use Rack::LiveReload, no_swf: true, use_swf: false
use Rack::Static, urls: [/\/$/], root: "_site", index: 'index.html'
run Rack::File.new('_site')

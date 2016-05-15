require 'rack/jekyll'
require 'rack-livereload'

use Rack::LiveReload,
  no_swf: true,
  use_swf: false

run Rack::Jekyll.new force_build: true, auto: true

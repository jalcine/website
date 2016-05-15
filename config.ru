require 'rack/jekyll'
require 'rack-livereload'

use Rack::LiveReload

run Rack::Jekyll.new(force_build: true, auto: true)

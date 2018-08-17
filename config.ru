# frozen_string_literal: true

require 'rubygems'
require 'bundler/setup'
require 'rack/livereload'

use Rack::LiveReload,
    no_swf: true,
    use_swf: false

# Serve all of the generated files from '_site' out to the local server.
use Rack::Static,
    root: File.expand_path('../_site', __FILE__),
    urls: [%r{\/*}],
    index: 'index.html'

run Rack::File.new('_site')

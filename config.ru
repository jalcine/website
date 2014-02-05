require './src/_plugins/bundler'
require 'rack-livereload'
require 'rack/contrib'
require 'rack/contrib/try_static'

use Rack::ProcTitle
use Rack::ETag
use Rack::LiveReload, vendored: false
use Rack::TryStatic, root: '_site', urls: %w[/],
  try: ['.html', '.htm', '/index.htm', '/index.html']

run Rack::Directory.new '_site'

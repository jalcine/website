require "rubygems"
require "rack/contrib/try_static"

use Rack::NotFound
use Rack::ETag
use Rack::Locale
use Rack::LiveReload
use Rack::TryStatic, root: "_site", urls: %w[/], try: ['.html', 'index.html', '/index.html']

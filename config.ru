require "rubygems"
require "bundler/setup"
require "rack/contrib/try_static"
require "rack/contrib/locale"
Bundler.require(:default)

use Rack::ETag
use Rack::Locale
#use Rack::LiveReload
use Rack::TryStatic, root: "_site", urls: %w[/], try: ['.html', 'index.html', '/index.html']

run lambda { [ ] }

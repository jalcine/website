require "rubygems"
require "bundler/setup"
require "rack/contrib/try_static"
require "rack/contrib/locale"
Bundler.require(:default)

use Rack::ETag
use Rack::Locale
use Rack::LiveReload, vendored: false
use Rack::TryStatic, root: "_site", urls: %w[/], try: ['.html', 'index.html', '/index.html']

class Foo
  def to_app
    nil
  end

  def self.call(obj)
    print obj.to_s
  end
end

run Foo.new

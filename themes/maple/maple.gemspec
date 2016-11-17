# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "maple"
  spec.version       = "0.0.1"
  spec.authors       = ["Jacky Alciné"]
  spec.email         = ["yo@jacky.wtf"]

  spec.summary       = %q{The packaged theme Jacky Alciné uses on his website.}
  spec.homepage      = "https://github.com/jalcine/website-theme"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(assets|_layouts|_includes|_sass|LICENSE|README)}i) }

  spec.add_runtime_dependency "jekyll", "~> 3.3"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.metadata["plugin_type"] = "theme"
end

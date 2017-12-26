require_relative '../lib/liquid/filters'
require_relative '../lib/liquid/tags'

TAGS_TO_ADD =
{
  'tweet'         => TwitterJekyll::TwitterTag,
  'tweetnocache'  => TwitterJekyll::TwitterTagNoCache,
}

def apply_tag(name, klass)
  Liquid::Template.register_tag(name, klass)
end

TAGS_TO_ADD.each { |name, klass| apply_tag(name, klass) }

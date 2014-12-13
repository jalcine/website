require_relative '../lib/timeline'
require_relative '../lib/liquid/tags'

TAGS_TO_ADD = {
  'tl_event'        => Timeline::EventBlock,
  'twitter'         => TwitterJekyll::TwitterTag,
  'twitternocache'  => TwitterJekyll::TwitterTagNoCache,
}

TAGS_TO_ADD.each do | tag_name, tag_class |
  Liquid::Template.register_tag(tag_name, tag_class)
end

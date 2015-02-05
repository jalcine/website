require_relative '../lib/timeline'
require_relative '../lib/liquid/tags'

TAGS_TO_ADD =
{
  'tl_event'      => Timeline::EventBlock,
  'tweet'         => Jekyll::TweetTag,
  'tweetnocache'  => Jekyll::TweetTagNoCache,
}

def apply_tag(name, klass)
  Liquid::Template.register_tag(name, klass)
end

TAGS_TO_ADD.each { | name, klass | apply_tag(name, klass) }

# A Liquid tag for Jekyll sites that allows embedding tweets using Twitter's
# oEmbed API, and showing the tweet as a blockquote for non-JavaScript enabled
# browsers and readers.
#
# Author: Jacky Alcine <me@jalcine.me>
# Source URL: https://gist.github.com/jalcine/
#
# Example usage:
#   {% showterm <ID> %}
#

module Jekyll
  class ShowTermTag < Liquid::Tag
    def initialize(tag_name, id, tokens)
      super
      @id = id.strip!
    end

    def render(context)
      "<iframe src=\"http://showterm.io/#{@id}#stop\" width=\"100%\" height=\"480\">Visit http://showterm.io/#{@id}.</iframe>"
    end
  end
end

Liquid::Template.register_tag('showterm', Jekyll::ShowTermTag)

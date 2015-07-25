module Jekyll
  module Image
    class Captioned < Liquid::Tag
      def initialize(_, uri, tokens)
        @uri = uri
        @caption = tokens.join ' '
      end

      def render(_)
        <<CAPTIONED_IMAGE
<figure class='captioned-image'>
  <img src="#{uri}" title="#{title}">
  <figcaption>#{caption}</figcaption>
</figure>
CAPTIONED_IMAGE
      end
    end
  end
end

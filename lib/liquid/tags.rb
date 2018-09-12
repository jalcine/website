# frozen_string_literal: true

require 'oembed'
require 'uri'

::OEmbed::Providers.register(::OEmbed::Providers::Instagram)
::OEmbed::Providers.register(::OEmbed::Providers::Twitter)
::OEmbed::Providers.register(::OEmbed::Providers::Youtube)
::OEmbed::Providers.register_fallback(::OEmbed::ProviderDiscovery, ::OEmbed::Providers::Embedly, ::OEmbed::Providers::OohEmbed)

module Jekyll
  # Serves as oEmbed block.
  class OEmbed < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def clean_up_html(html)
      html
    end

    def generate_html(result)
      <<~HTML
<div class="w-100 center pt4 embed embed-type__#{result.type} embed-provider__#{result.provider_name}">
  #{clean_up_html(result.html)}
</div>
      HTML
    end

    def render(context)
      url = Liquid::Template.parse(@text).render context
      begin
        result = ::OEmbed::Providers.get(url.strip!)
        generate_html(result)
      rescue StandardError
      end
    end
  end

  class Quote < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
      @text = text
      @tokens = tokens
    end

    def render(_context)
      puts @tokens
      <<~HTML
<div class="pa4">
  <blockquote class="serif ml0 mt0 pl4 black-90 bl bw2 b--blue">
    <p class="f5 f4-m f3-l lh-copy measure mt0">
      #{@text}
    </p>
    <cite class="f6 ttu tracked fs-normal">
      &emdash; #{@tokens['author']} in
      <a href="#{@tokens['url']}">#{@tokens['title']}</a>
    </cite>
  </blockquote>
</div>
      HTML
    end
  end
end

Liquid::Template.register_tag('oembed', Jekyll::OEmbed)
Liquid::Template.register_tag('quote', Jekyll::Quote)

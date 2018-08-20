# frozen_string_literal: true
require 'oembed'
require 'uri'

# register all default OEmbed providers
::OEmbed::Providers.register_all
# since register_all does not register all default providers, we need to do this here. See https://github.com/judofyr/ruby-oembed/issues/18
::OEmbed::Providers.register(::OEmbed::Providers::Instagram, ::OEmbed::Providers::Slideshare, ::OEmbed::Providers::Yfrog, ::OEmbed::Providers::MlgTv)
::OEmbed::Providers.register_fallback(::OEmbed::ProviderDiscovery, ::OEmbed::Providers::Embedly, ::OEmbed::Providers::OohEmbed)

module Jekyll
  class OEmbed < Liquid::Tag

    def initialize(tag_name, text, tokens)
       super
       @text = text
    end
    
    def render(context)
      # pipe param through liquid to make additional replacements possible
      url = Liquid::Template.parse(@text).render context

      # oembed look up
      begin
        result = ::OEmbed::Providers.get(url.strip!)
        
        # Odd: slideshare uses provider-name instead of provider_name
        provider = result.fields['provider_name'] || result.fields['provider-name'] || 'unknown'

        result = <<-HTML
<div class="w-100 center pt4 embed embed-type__#{result.type} embed-provider__#{provider}">
  #{result.html}
</div>
HTML
        "<div class=\"embed #{result.type} #{provider}\">#{result.html}</div>"
      rescue
        "<a href=\"#{url}\">#{url}</a>"
      end
    end
  end
end

Liquid::Template.register_tag('oembed', Jekyll::OEmbed)

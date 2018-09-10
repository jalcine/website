# frozen_string_literal: true

module TagLinksFilter
  def linkify_tags(list)
    list.map! do |tag_name|
      <<LINK
  <a class="p-category"
    target="_blank"
    href="/weblog/tag/#{tag_name}/"
    title="#{tag_name}">
    #{tag_name}
  </a>
LINK
    end
    list.join ', '
  end
end

Liquid::Template.register_filter(TagLinksFilter)

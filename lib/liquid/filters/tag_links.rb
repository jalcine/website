module TagLinksFilter
  def linkify_tags(list)
    list.map! { |v| "<a class='p-category' target='_blank' href='/weblog/tag/#{v}/' title='#{v}'>#{v}</a>" }
    list.join ', '
  end
end

Liquid::Template.register_filter(TagLinksFilter)

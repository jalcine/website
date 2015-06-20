module TagLinksFilter
  def linkify_tags(list)
    puts list
    list.map! { |v| "<a href='/weblog/tag/#{v}' title='#{v}'>#{v}</a>" }
    puts list
    list
  end
end

Liquid::Template.register_filter(TagLinksFilter)

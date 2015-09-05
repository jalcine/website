module TagLinksFilter
  def linkify_tags(list)
    list.map! { |v| "<a href='/weblog/tag/#{v}' title='#{v}'>#{v}</a>" }
    puts list
    list.join '\n'
    'dfkkdsfjdlkf'
  end
end

Liquid::Template.register_filter(TagLinksFilter)

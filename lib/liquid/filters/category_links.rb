module CategoryLinksFilter
  def linkify_categories(list)
    if list.is_a? Array
      list.map! { |v| "<a target='_blank' href='/weblog/categories/#{v}/' title='#{v}'>#{v}</a>" }
      list.join ', '
    else
      "<a target='_blank' href='/weblog/categories/#{list}/' title='#{list}'>#{list}</a>" 
    end
  end
end

Liquid::Template.register_filter(CategoryLinksFilter)

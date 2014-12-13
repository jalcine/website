require 'liquid/block'
require_relative '../liquid/extensions'

module Timeline
  #
  # Represents a specific event that transpired on a timeline.
  #
  class EventBlock < Liquid::Block
    include Liquid::Extensions::ArgumentParser
    include Liquid::Extensions::UniqueClassForTag

    attr_reader :title, :time

    def initialize(tag_name, markup, tokens)
      options = parse_argument_string markup
      @title = options[:title] || ''
      @time = DateTime.parse(options[:time]) || Date.now
      super
    end

    def render(context)
      context[:event] = {
        title: title,
        time:  time
      }
      content = super(context)
      simple_name = simplify_text('event', title)

      return <<-HTML
<section class="event #{simple_name}" data-time="#{time.to_s}">
  <h3>
    <a name="#{simple_name}" title="#{title}">
      #{title}
    </a>
  </h3>
  <p>
    #{content}
  </p>
</section>
HTML
    end
  end
end

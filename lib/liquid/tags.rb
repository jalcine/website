# frozen_string_literal: true

module JackyWtf
  class StubBlock < Liquid::Block
    def render(_context)
      'TODO: Fix this block'
    end
  end

  class StubTag < Liquid::Tag
    def render(_context)
      'TODO: Fix this tag'
    end
  end
end

Liquid::Template.register_tag('quote', JackyWtf::StubBlock)
Liquid::Template.register_tag('video', JackyWtf::StubTag)
Liquid::Template.register_tag('youtube', JackyWtf::StubTag)

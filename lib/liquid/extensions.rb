require 'liquid/standardfilters'
require 'cgi'

module Liquid
  module Extensions
    module ArgumentParser
      def parse_argument_string(string)
        string.chomp!
        arg_regex = %r{\"\s(\")?}
        tokens = string.split arg_regex

        parsed_arg_hash = {}
        tokens.each do | token |
          argument_tokens = token.split ':'
          argument_name  = argument_tokens.shift
          argument_value = argument_tokens.shift
          argument_value = argument_value.slice(1,argument_value.length - 1)

          parsed_arg_hash[argument_name.to_sym] = argument_value
        end

        parsed_arg_hash
      end
    end

    module UniqueClassForTag
      HTML_SHRINK = {
        '&'.freeze => '_'.freeze,
        '-'.freeze => '_'.freeze,
        '>'.freeze => '',
        '<'.freeze => '',
        '"'.freeze => '',
        "'".freeze => ''
      }

      def simplify_text(tag_name, value)
        tag_name = tag_name.downcase
        value = CGI.escape(value.downcase)
        "#{tag_name}--#{value}"
      end
    end
  end
end

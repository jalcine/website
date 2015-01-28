# Title: Storify tag for Jekyll
# Author: Zach Thomae (@zthomae)
# Description:
#   Given a path to a Storify story, will embed the story in the page.
#
# Source url: https://github.com/zthomae/octopress-storify
#
# Syntax: {% storify username/name-of-story %}
#
# Example:
#
# Input: {% storify zthomae/a-bunch-of-people-who-want-to-know-if-obama-is-gay %}
# Output: <script src="//storify.com/zthomae/a-bunch-of-people-who-want-to-know-if-obama-is-gay.js"></script><noscript>[<a href="//storify.com/zthomae/a-bunch-of-people-who-want-to-know-if-obama-is-gay" target="_blank">View the story "A bunch of people who want to know if Obama is gay" on Storify</a>]</noscript>
#

module Jekyll
  class Storify < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      if /(?<path>(\w+\/[\w-]+))/ =~ markup
        @path = path
        @title = path.split('/')[1].gsub('-', ' ').titlecase
      end
    end

    def render(context)
      if @path
        "<script src=\"//storify.com/#{@path}.js\"></script><noscript>[<a href=\"//storify.com/#{@path}\" target=\"blank\">View the story \"#{@title}\" on Storify</a>]</noscript>"
      else
        "Error processing input, expected syntax: {% storify username/name-of-story %}"
      end
    end
  end
end

Liquid::Template.register_tag('storify', Jekyll::Storify)

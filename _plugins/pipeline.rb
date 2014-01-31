require 'jekyll_asset_pipeline'
require 'compass'

module JekyllAssetPipeline
  # process SCSS files
  class SassConverter < JekyllAssetPipeline::Converter
    Compass.configuration.sass_dir = '_assets/css'
    Compass.sass_engine_options[:load_paths].each do |path|
      Sass.load_paths << path
    end

    def self.filetype
      '.sass'
    end

    def convert
      Sass::Engine.new(@content, syntax: :sass).render
    end
  end

  class CssCompressor < JekyllAssetPipeline::Compressor
    require 'yui/compressor'

    def self.filetype
      '.css'
    end

    def compress
      YUI::CssCompressor.new.compress(@content)
    end
  end
end

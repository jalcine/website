# vim: set ft=ruby :
guard :bundler do
  watch('Gemfile')
end

guard :livereload do
  watch(%r{^_site}) { |m| "#{m[0]}" }
end

guard :rack, port: 3000 do
  watch('Gemfile.lock')
  watch('config.ru')
end

guard 'jekyll-plus', serve: false, future: true, drafts: true, silent: true do
  watch(/^src/)
  watch('_config.yml')
end

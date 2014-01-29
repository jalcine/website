guard :bundler do
  watch('Gemfile')
end

guard :livereload do
  watch /^_site/
  watch(/^*\.haml$/) { |m | "#{m[1]}.html"}
  watch(/^*\.css$/) { |m | "#{m[1]}.css"}
end

guard 'ctags-bundler' do
  watch /^_plugins/
  watch 'Gemfile.lock'
end

guard :rack, port: 1993 do
  watch 'config.ru'
  watch 'Gemfile.lock'
end

guard 'jekyll-plus', serve: false do
  watch /^_(posts|drafts|includes|layouts)/
  watch /^*\.haml$/
  ignore /^_site/
end

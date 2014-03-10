guard :bundler do
  watch('Gemfile')
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
  watch /^src\/_(posts|drafts|includes|layouts)/
  watch /^*\.haml$/
  ignore /^_site/
end

guard :sass, source: 'src/_sass', destination: './_site/css' do
  watch /^src\/_sass/
end

guard :livereload do
  watch /^_site*/
  ignore /^src/
end

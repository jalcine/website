# vim: set ft=ruby tw=78 fdm=syntax

guard :livereload do
  watch('_site')
end

guard :rack, port: 1993 do
  watch('Gemfile.lock')
  watch('config.ru')
end

guard :bundler do
  watch('Gemfile')
end

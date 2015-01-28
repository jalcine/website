# vim: set ft=ruby :
guard :bundler do
  watch('Gemfile')
end

guard :livereload do
  watch(/^_site/) { |m| "#{m[0]}" }
end

guard :rack, port: 3000, host: 'stark.jalcine', server: :webrick do
  watch('Gemfile.lock')
  watch('config.ru')
end

guard 'jekyll-plus', serve: false, future: true, drafts: true,
                     silent: true, config: ['_config.yml'] do
  watch(/^src/)
  watch(/^plugins/) { '_config.yml' }
  watch('_config.yml')
end

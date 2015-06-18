# vim:set ft=ruby:

clearing :on

# Automatically install gems when I add some to my gem list.
guard :bundler do
  watch 'Gemfile'
end

# Handle the act of live reloading changes to the browser (hard refreshes)
guard :livereload do
  watch(/^_site*.(html|css|js)/) { |m| "#{m[0]}" }
end

# Load a Rack server to handle the local serving of the site.
guard :rack,
      port: 1993, server: :puma, force_run: true, daemon: true,
      cmd: 'bin/rackup' do
  watch 'Gemfile.lock'
  watch 'config.ru'
end

# Monitor the files for Jekyll and include in a special development mode.
guard 'jekyll-plus', serve: false, future: true, drafts: true,
                     silent: true, config: ['_config.yml'] do
  watch(/^src/)
  watch(/^plugins/)
  watch('_config.yml')
end

# vim :set ft=ruby:

clearing :off
notification :tmux, display_message: false

# Automatically install gems when I add some to my gem list.
guard :bundler do
  watch 'Gemfile'
end

# Handle the act of live reloading changes to the browser (hard refreshes)
guard :livereload do
  watch(/^_site*.(?!asset-cache)*(html|css|js)/) { |m| "/#{m[0]}" }
end

# Load a Rack server to handle the local serving of the site.
guard :rack,
      port: 1993, server: :puma, force_run: true, daemon: true,
      host: '0.0.0.0', cmd: 'bin/rackup' do
  watch 'Gemfile.lock'
  watch 'config.ru'
end

# Monitor the files for Jekyll and include in a special development mode.
guard 'jekyll-plus', serve: false, silent: true, drafts: true,
  config: ['_config.dev.yml', '_config.yml'] do
  watch(/^src/)
  watch(/^plugins/)
  watch(/^_config(.*)\.yml/)
end

# Check on the npm packages we pull in.
guard :npm do
  watch('src/package.json')
end

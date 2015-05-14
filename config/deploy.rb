require 'mina/multistage'
require 'dotenv'
require_relative '../lib/mina'

Dotenv.load

set :user, ENV['JALCINE_WEB_USER']
set :web_user, 'www-data'
set :domain, ENV['JALCINE_DOMAIN']
set :deploy_to, ENV['JALCINE_WWW']

set :forward_agent, true
set :rsync_source, File.expand_path('../..', __FILE__) + '/_site/*'
set :rsync_options, [
  '--recursive',
  '--archive',
  '--compress',
  '--ignore-existing',
  '--checksum',
  '--delete'
]

namespace :maintenance do
  task :start do
    puts '-> Setting site to be in maintenance mode...'
    queue %(
      touch #{deploy_to}/maintain.txt
    )
  end
  task :stop do
    puts '-> Setting site to be in maintenance mode...'
    queue %(
      rm #{deploy_to}/maintain.txt
    )
  end
end

task :logs do
  queue 'echo "Tailing all logs for nginx."'
  queue 'sudo tail -f /var/log/nginx/*.log'
end

task :deploy do
  invoke :'jekyll:clean'

  deploy do
    invoke :'jekyll:build'
    invoke :'rsync:copy'

    to :clean do
      invoke :'jekyll:clean'
    end
  end
end

task :prep do
  invoke :'rsync:setup'
  invoke :'setup'
  puts '-> Correcting permissions for files..'
  queue %(
    rm /var/www/.profile -f
    rm /var/www/.bash* -f
  )
  puts '-> Corrected permissions for files.'
end

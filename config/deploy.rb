require_relative '../lib/mina'
require 'mina/multistage'
require 'dotenv'

Dotenv.load

set :user, ENV['JALCINE_WEB_USER']
set :web_user, 'www-data'
set :domain, 'howard.jalcine.me'
set :forward_agent, true
set :deploy_to, '/var/www/jalcine-www'
set :rsync_source, File.expand_path('../..', __FILE__) + '/_site/*'
set :rsync_options, [
  '--recursive',
  '--archive',
  '--compress',
  '--ignore-existing',
  '--checksum',
  '--delete'
]

task :logs do
  queue 'echo "Tailing all logs for nginx."'
  queue 'sudo tail -f /var/log/nginx/*.log'
end

namespace :maintenance do
  task :start do
    puts '-> Setting site to be in maintenance mode...'
    queue %(
      sudo touch #{deploy_to}/maintain.txt
    )
  end

  task :stop do
    puts '-> Setting site to be in maintenance mode...'
    queue %(
      rm #{deploy_to}/maintain.txt
    )
  end
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
    sudo chown -R #{web_user}:www-data /var/www/jalcine-www 2> /dev/null
    rm /var/www/.profile 2> /dev/null
    rm /var/www/.bash* 2> /dev/null
  )
  puts '-> Corrected permissions for files.'
end

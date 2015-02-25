require_relative '../lib/mina'
require 'mina/multistage'

set :user, 'heimdall'
set :domain, 'howard.jalcine.me'
set :forward_agent, true
set :deploy_to, '/var/www/jalcine-www'
set :rsync_source, File.expand_path('../..', __FILE__) + '/_site/*'
set :rsync_options, [
  '--recursive',
  '--times',
  '--delete-during',
  '--archive',
  '--progress',
  '--compress',
  '--ignore-existing',
  '--checksum',
  '-6'
]

task :logs do
  queue 'echo "Tailing all logs for nginx."'
  queue 'sudo tail -f /var/log/nginx/*.log'
end

# TODO: Add a maintenance mode.
namespace :maintenance do
  task :start do
    puts "-> Setting site to be in maintenance mode..."
  end

  task :stop do
    puts "-> Setting site to be in maintenance mode..."
  end
end

task :deploy do
  deploy do
    puts "-> Deploying to #{deploy_to}..."
    invoke :'jekyll:clean'
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
  queue %{
    chown -R :www-data /var/www/jalcine-www 2> /dev/null
    rm /var/www/.profile 2> /dev/null
    rm /var/www/.bash* 2> /dev/null
    ls -lla #{deploy_to}
  }
end

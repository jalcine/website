require_relative '../lib/mina'
require 'mina/multistage'

set :user, 'vagrant'
set :domain, 'jacky.wtf'
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

# TODO: Add a maintenance mode.
# TODO: Add rules to restart nginx.

task :logs do
  queue 'echo "Tailing all logs for nginx."'
  queue 'sudo tail -f /var/log/nginx/*.log'
end

task :deploy do
  deploy do
    puts "-> Deploying to #{deploy_to}..."
    invoke :'jekyll:clean'
    invoke :'jekyll:build'
    invoke :'rsync:copy'

    to :launch do
      queue %{
        chown -R www-data:www-data /var/www
      }
    end

    to :clean do
      invoke :'jekyll:clean'
    end
  end
end

task :prep do
  invoke :'rsync:setup'
  invoke :'setup'
  queue %{
    chown -R www-data:www-data /var/www
    rm /var/www/.profile
    rm /var/www/.bash*
    ls -lla /var/www
  }
end

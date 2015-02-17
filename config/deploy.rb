require 'mina/rsync'
require 'mina/multistage'

set :domain,         'virgil.jalcine.me'
set :repository,     '.'
set :branch,         'master'
set :forward_agent,   true
set :deploy_to,      '/var/www/jalcine-www'

task :logs do
  queue 'echo "Tailing all logs for nginx."'
  queue 'sudo tail -f /var/log/nginx/*.log'
end

task :deploy do
  deploy do
    binding.pry
    invoke "rsync:deploy"

    to :launch do; end
    to :clean do; end
  end
end

namespace :deploy do
  task :setup do
    queue "mkdir -p #{deploy_to}"
  end
end

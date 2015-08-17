require 'mina/bundler'
require 'mina/rbenv'
require 'dotenv'

Dotenv.load

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, ENV['JALCINE_DEPLOY_DOMAIN']
set :deploy_to, ENV['JALCINE_DEPLOY_PATH']
set :repository, 'git://git.jacky.wtf/website'
set :branch, 'master'

set :shared_paths, ['']

set :user, ENV['JALCINE_DEPLOY_USER']
set :forward_agent, true

task :environment do
  invoke :'rbenv:load'
end

desc "Deploys the current version to the server."
task :deploy => :environment do
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

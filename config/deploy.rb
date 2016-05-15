require 'mina/bundler'
require 'mina/rbenv'
require 'mina/scp'
require 'dotenv'

Dotenv.load

set :domain, ENV['JALCINE_DEPLOY_DOMAIN']
set :deploy_to, ENV['JALCINE_DEPLOY_PATH']
set :verbose, true
set :keep_releases, 10

set :shared_paths, ['images']

set :user, ENV['JALCINE_DEPLOY_USER']
set :forward_agent, true

task :environment do
  invoke :'rbenv:load'
end

task :upload do
  ssh "mkdir -p #{deploy_to}/tmp-scp"
  scp_upload("-v #{Dir.pwd}/_site/*", "#{deploy_to}/tmp-scp",
             recursively: true,
             verbose: true)
  queue "cp -vr #{deploy_to}/tmp-scp/* ."
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  deploy do
    invoke :upload
  end
end

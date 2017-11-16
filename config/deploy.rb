# frozen_string_literal: true

require 'mina/scp'

set :domain, ENV['JALCINE_DEPLOY_DOMAIN']
set :deploy_to, ENV['JALCINE_DEPLOY_PATH']
set :verbose, true
set :keep_releases, 5

set :shared_paths, ['images']

set :user, ENV['JALCINE_DEPLOY_USER']
set :group, ENV['JALCINE_DEPLOY_GROUP']
set :forward_agent, true

task :upload do
  ssh "mkdir -p #{deploy_to}/tmp-scp"
  scp_upload("#{Dir.pwd}/_deploy/*", "#{deploy_to}/tmp-scp",
             recursively: true,
             verbose: true)
  queue "cp -r #{deploy_to}/tmp-scp/* ."
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  deploy do
    invoke :upload
    to :launch do
      queue "chown :#{group} -Rc #{deploy_to}"
    end
  end
end

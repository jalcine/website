lock '3.3.5'

set :scm, :none
set :deploy_via, :copy
set :application, 'jalcine-www'
set :use_sudo, false
set :keep_releases, 10

set :user,  :heimdall
set :group, :heimdall

before 'deploy:update', 'jekyll:update'

namespace :deploy do
  [:start, :stop, :restart, :finalize_update].each do |task|
    desc "#{task} task has no function"
    task task, :roles => :app do ; end
  end
end

namespace :jekyll do

  desc 'Run jekyll to update site before uploading'
  task :update do
    %x(rm -rf _site/* && bundle exec jekyll)
  end
end 

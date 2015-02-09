lock '3.3.5'

set :scm, :local
set :local_strategy, :archive
set :application, 'jalcine-www'
set :repo_url, '_site'
set :use_sudo, false
set :keep_releases, 10

set :user,  :heimdall
set :group, :heimdall

before 'deploy', 'jekyll:update'

namespace :jekyll do
  desc 'Run jekyll to update site before uploading'
  task :update do
    %x(rm -rf _site/* && bundle exec jekyll)
  end
end 

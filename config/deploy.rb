lock '3.3.5'

set :application, 'jalcine-www'
set :repo_url, 'git://github.com/jalcine/jalcine.me'
set :deploy_to, ENV['JALCINE_DEPLOY_ROOT']
set :keep_releases, 10

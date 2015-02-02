role :web, %w(deployer@virgil.jalcine.me)
set :deploy_to, "#{ENV['JALCINE_DEPLOY_ROOT']}-prod"
set :branch, 'master'

role :web, %w(virgil.jalcine.me)
set :deploy_to, "#{ENV['JALCINE_DEPLOY_ROOT']}-staging"
set :branch, 'staging'

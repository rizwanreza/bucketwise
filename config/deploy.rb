set :application, "bucketwise.rizwanreza.com"
set :db_name, "bucketwise"
set :repository,  "git@github.com:rizwanreza/bucketwise.git"
set :port, 1111
set :use_sudo, false

set :domain, 'rizwanreza.com'
set :user, 'deploy'
set :deploy_to, "/home/#{user}/public/#{application}"

set :scm, :git

role :web, domain
role :app, domain
role :db,  domain, :primary => true

namespace :deploy do
  task :start do; end
  task :stop do; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

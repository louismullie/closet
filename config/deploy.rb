# To show password prompt in console.
default_run_options[:pty] = true

# Git information
set :scm, :git
set :scm_verbose, true

# Login information
set :user, "root"
set :domain, "server.com"
set :use_sudo, false

# Repository information
set :repository,  "git@github.com:username/project.git"
set :branch, 'master'
set :deploy_to, "/var/www/project"
set :deploy_via, :remote_cache

# Server information
role :web, "yourserver.com"         
role :app, "yourserver.com"               

# To run bundle install on deploy.
require 'bundler/capistrano' 
after "deploy", "deploy:bundle_gems"
after "deploy:bundle_gems", "deploy:restart"

# Passenger tasks (fill this in).
namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart do; end
end
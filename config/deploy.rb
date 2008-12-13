#############################################################
#	Application
#############################################################

set :application, "standup"
set :deploy_to, "/home/sexton/standup.fuzzymonk.com"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, true
set :scm_verbose, true 

#############################################################
#	Servers
#############################################################

set :user, "sexton"
set :domain, "standup.fuzzymonk.com"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Git
#############################################################

set :scm, :git
set :branch, "master"
set :repository, "git://github.com/csexton/standup.git"
set :deploy_via, :remote_cache

#############################################################
#	Passenger
#############################################################

namespace :deploy do
  
  # Restart passenger on deploy
  desc "Restarting mod_rails with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end

  #desc "After symlinking current version, symlink to the production sqlite DB"
  #task :after_update_code do 
  #  # Link it from the shared folder. 
  #  run "ln -s #{deploy_to}/#{shared_dir}/db/production.sqlite3 #{current_release}/db/production.sqlite3" 
  #end 

end

#set :stages, %w(staging production)
#set :default_stage, "production"
#require File.expand_path("#{File.dirname(__FILE__)}/../vendor/gems/capistrano-ext-1.2.1/lib/capistrano/ext/multistage")

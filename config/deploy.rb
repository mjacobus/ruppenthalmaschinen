require "bundler/capistrano"


set :application, "test.ruppenthalmaschinen.com.br"

# user defined vars
set :user, 'marceloadmin'
set :deploy_to, "/webapps/#{application}"
set :domain, "www.ruppenthalmaschinen.com.br"
after 'deploy:update_code', 'deploy:symlink_db', 'deploy:remove_rvm_file'


default_run_options[:pty] = true
   
# ssh
ssh_options[:forward_agent] = true
#ssh_options[:verbose] = :debug

# SCM
set :repository,  "git@github.com:mjacobus/Diego.git"
set :scm, :git
set :git_enable_submodules,1
set :branch, 'development'
# set :git_shallow_clone, 1
set :scm_verbose, true


# roles (servers)
role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true        # This is where Rails migrations will run
# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#
# share database.yml
#
# after 'deploy:update_code', 'deploy:symlink_db'
namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
end

namespace :deploy do
  desc "Remove .rvmrc"
  task :remove_rvm_file, :roles => :app do
    run "rm #{release_path}/.rvm.rc"
  end
end


# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    # run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

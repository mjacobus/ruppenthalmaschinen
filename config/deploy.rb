require "bundler/capistrano"


set :application, "www.ruppenthalmaschinen.com.br"

# user defined vars
set :user, 'marceloadmin'
set :deploy_to, "/webapps/#{application}"
set :domain, "www.ruppenthalmaschinen.com.br"
after 'deploy:update_code', 'deploy:symlink_db','deploy:symlink_email_config'


default_run_options[:pty] = true

# ssh
ssh_options[:forward_agent] = true
#ssh_options[:verbose] = :debug

# SCM
set :repository,  "git@github.com:mjacobus/ruppenthalmaschinen.git"
set :scm, :git
set :git_enable_submodules,1
set :branch, 'master'
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
  desc "Symlinks email.yml"
  task :symlink_email_config, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/email.yml #{release_path}/config/email.yml"
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


# http://www.bencurtis.com/2011/12/skipping-asset-compilation-with-capistrano/
# skips precompile if there is no change
namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end
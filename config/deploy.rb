set :application, 'faculty_information_systeim'
set :stages, %w(staging production)
set :default_stage, "staging"
set :stage, :staging

set :rails_env, "staging"

#set :default_run_options[:pty] = false
set :user, "cap_user"
set :scm_passphrase, "cap_user@123"
set :ssh_options, { :forward_agent => true,keys: File.open("../dep_keys/cap_key") }
#set :domain, "96.126.126.229"
server '54.251.191.162' ,roles: [:web, :app, :db], user: 'cap_user'

set :scm , :github
set :scm_user, "kasun"
set :repo_url , 'git@gitlab.com:kasun/uni-sis.git'
set :branch , "staging"

set :keep_releases, 5



#ssh_options[:keys] = [File.open("../dep_keys/cap_key")]

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git



lock "~> 3.16.0"

set :nginx_downstream_uses_ssl, true
set :application, "katakorisu"
set :repo_url, "git@github.com:arias-hooks/katakorisu.git"
set :user, 'asa_koshiro'
set :deploy_to, "/var/www/katakorisu"
set :linked_files, %w[config/database.yml config/credentials/production.key]
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets public/system vendor/bundle]
set :rbenv_ruby, File.read('.ruby-version').strip
set :puma_threds, [4, 16]
set :puma_workers, 0
set :puma_bind, "unix:///var/www/katakorisu/shared/tmp/sockets/puma.sock"
set :puma_state, "/var/www/katakorisu/shared/tmp/pids/puma.state"
set :puma_pid, "/var/www/katakorisu/shared/tmp/pids/puma.pid"
set :puma_access_log, "/var/www/katakorisu/shared/log/puma.error.log"
set :puma_error_log, "/var/www/katakorisu/shared/log/puma.access.log"
set :puma_preload_app, true
set :branch, ENV['BRANCH'] || "main"
set :puma_systemctl_bin, '/usr/bin/systemctl'
set :puma_systemctl_user, :system
set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }

namespace :deploy do
  desc 'upload important files'
  task :upload do
    on roles(:app) do
      sudo :mkdir, '-p', "/var/www/katakorisu/shared/config"
      sudo %[chown -R #{fetch(:user)}.#{fetch(:user)} /var/www/#{fetch(:application)}]
      sudo :mkdir, '-p', '/etc/nginx/sites-enabled'
      sudo :mkdir, '-p', '/etc/nginx/sites-available'

      upload!('config/credentials/production.key', "/var/www/katakorisu/shared/config/credentials/production.key")
      upload!('config/database.yml', "/var/www/katakorisu/shared/config/database.yml")
    end
  end

  desc 'Create database'
  task :db_create do
    on roles(:db) do
      with rails_env: fetch(:rails_env) do
        within release_path do
          execute :bundle, :exec, :rake, 'db:create'
        end
      end
    end
  end

  before :starting, :upload
  before 'check:linked_files', 'puma:nginx_config'
  before :publishing, 'db:seed_fu'
end

after 'deploy:published', 'nginx:restart'
before 'deploy:migrate', 'deploy:db_create'

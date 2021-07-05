require File.expand_path(File.dirname(__FILE__) + "/environment")

rails_env = ENV['RAILS_ENV'] || :production

set :environment, rails_env
set :output, environment == 'development' ? 'log/crontab.log' : '/var/www/katakorisu/shared/log/crontab.log'
job_type :rake, 'export PATH="$HOME/.rbenv/bin:$PATH"; eval "$(rbenv init -)"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output'

every '0 9-21 * * *' do
  rake 'squirrel_increase:update_squirrel_number'
end

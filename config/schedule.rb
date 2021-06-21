require File.expand_path(File.dirname(__FILE__) + "/environment")

rails_env = ENV['RAILS_ENV'] || :development

set :environment, rails_env
set :output, "#{Rails.root}/log/cron.log"

every '0 9-21 * * *' do
  rake 'squirrel_increase:update_squirrel_number'
end

env :PATH, ENV['PATH']
env :GEM_PATH, ENV['GEM_PATH']

set :output, "/var/log/cron_log.log"

every 1.minutes do
  rake "post:create"
end
# Use this file to easily define all of your cron jobs.
# Learn more: http://github.com/javan/whenever

set :output, "log/cron_log.log"

every 1.hour do
  rake 'offers:update_status'
end
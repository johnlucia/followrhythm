threads Integer(ENV['MIN_THREADS']  || 1), Integer(ENV['MAX_THREADS'] || 16)

workers Integer(ENV['PUMA_WORKERS'] || 3)

rackup DefaultRackup
port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'
preload_app!

on_worker_boot do
  # worker specific setup
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

before_fork do
  require 'puma_worker_killer'

  # Restart on a set time interval
  # PumaWorkerKiller.enable_rolling_restart(2 * 3600) # 2 hours in seconds
  # OR, restart at percantage 
  PumaWorkerKiller.start
end

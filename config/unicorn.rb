worker_processes 3
preload_app true
timeout 100000
listen 3000

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection
end
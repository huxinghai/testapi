require "redis"
$redis = Redis.new({ :host => "localhost",
                     :port => 6379,
                     :db => 0,
                     :namespace => "cache",
                     :expires_in => 60.minutes })

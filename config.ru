require "./app"

run Rack::URLMap.new("/" => BroadCastor::App)
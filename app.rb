require "sinatra"

require_relative "routes/channels"

module BroadCastor
  class App < Sinatra::Application
    set :title, "Broadcastor".freeze

    use Routes::Channels

    get "/" do
      redirect "/hi"
    end
  end
end

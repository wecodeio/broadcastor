require "sinatra"

require_relative "routes/channels"
require_relative "routes/sessions"

module BroadCastor
  class App < Sinatra::Application
    set :title, "Broadcastor".freeze

    use Routes::Channels
    use Routes::Sessions

    get "/" do
      redirect "/channels/programacion-avanzada"
    end
  end
end

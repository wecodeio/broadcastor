require_relative "base"

module BroadCastor
  module Routes
    class Channels < Base

      get "/channels/:slug.json" do
        json [
          {'timestamp' => Time.now.to_i,
           'body' => 'Fast just got faster with Nexus S.'},
          {'timestamp' => Time.new(2014, 7, 31).to_i,
           'body' => 'The Next, Next Generation tablet.'},
          {'timestamp' => Time.new(2014, 7, 30).to_i,
           'body' => 'The Next, Next, Next Generation tablet.'}
        ]
      end

      get "/channels/:slug/after/:timestamp.json" do
        json [
          {'timestamp' => Time.now.to_i,
           'body' => 'The Next, Next Generation tablet 2.'}
        ]
      end

      get "/channels/:slug" do
        # Get channel with this specific slug, and show it
        haml :"channels/show", locals: { slug: params[:slug] }
      end

    end
  end
end

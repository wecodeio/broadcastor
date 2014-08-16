require "sinatra/base"
require "sinatra/content_for"
require "sinatra/json"
require "sinatra/asset_pipeline"
require "rack-flash"
require "haml"
require "sass"
require "json"

require_relative "../models/channel"

Dir["./helpers/*.rb"].each { |helper| require helper }

module BroadCastor
  module Routes
    class Base < Sinatra::Base
      configure do
        enable :method_override
        enable :static, :logging if development?
      end

      set :server, :thin
      set :root, File.realpath("..", File.dirname(__FILE__))
      set :public_folder, File.realpath("../public/system", File.dirname(__FILE__))

      set :assets_precompile, %w(application.js application.css *.png *.gif *.svg *.eot *.ttf *.woff *.otf routes/**/*.js)
      set :assets_prefix, %w(assets)
      set :assets_css_compressor, :sass
      set :assets_js_compressor, :uglifier
      register Sinatra::AssetPipeline

      set :haml, format: :html5

      helpers Sinatra::ContentFor

      enable :sessions
      set :session_secret, ENV["SESSION_SECRET"]
      use Rack::Flash, sweep: true
    end
  end
end

require "sinatra/base"
require "sinatra/content_for"
require "sinatra/json"
require "sinatra/asset_pipeline"
require "rack-flash"
require "haml"
require "sass"
require "json"
require "./middleware/authentication"

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

      helpers Sinatra::ContentFor, NamedRoutes, FlashHelper

      enable :sessions
      set :session_secret, ENV["SESSION_SECRET"]
      use Rack::Flash, sweep: true

      use Middleware::Authentication

      protected

      def current_user
        unless instance_variable_defined?(:@current_user)
          @current_user = request.env["current_user"]
        end
        @current_user
      end

    end
  end
end

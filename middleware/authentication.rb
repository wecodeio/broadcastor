require_relative "../helpers/named_routes"

module Middleware
  class Authentication
    class << self
      include NamedRoutes
    end

    # UNAUTHENTICATED_PATHS = { "GET" => [new_session_path, new_user_path],
    #                           "POST" => [sessions_path, users_path] }.freeze
    SESSION_KEY = "rack.session".freeze
    USER_ID_KEY = "user_id".freeze
    # ASSETS_PATH_REGEXP = %r(\A/assets/)
    
    def initialize(app)
      @app = app
    end
    
    def call(env)
      dup.call!(env)
    end
    
    def call!(env)
      # if login_required?(env)
      #   [307, { "Location" => "/login" }, []]
      # else
        puts "ALALALALAAL"
        if env[SESSION_KEY][USER_ID_KEY]
          user_id = env[SESSION_KEY][USER_ID_KEY].to_i
          env["current_user"] = User[user_id]
        end
        return @app.call(env)
      # end
      
    end
    
  # private
  
  #   def login_required?(env)
  #     request_path = env["REQUEST_PATH"]
  #     request_path = env["PATH_INFO"] if request_path.blank?
  #     return false if request_path =~ ASSETS_PATH_REGEXP
  #     return false if env[SESSION_KEY][USER_ID_KEY]
      
  #     UNAUTHENTICATED_PATHS.fetch(env["REQUEST_METHOD"], []).none? { |path| path == request_path }
  #   end
  end
end
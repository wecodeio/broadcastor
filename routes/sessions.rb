require_relative "base"
require_relative "../use_cases/sessions/login_user"

module BroadCastor
  module Routes
    class Sessions < Base
      get "/login" do
        session[:user_id] = nil
        haml :"sessions/new"
      end
      
      post "/sessions" do
        use_case = ::Sessions::LoginUser.new(params[:username])
        
        if use_case.execute(params[:password])
          session[:user_id] = use_case.user.id
          redirect root_path
        else
          flash.now[:error] = "Invalid username and/or password"
          haml :"sessions/new"
        end
      end
      
      delete "/session" do
        session[:user_id] = nil
        redirect new_session_path
      end
    end
  end
end

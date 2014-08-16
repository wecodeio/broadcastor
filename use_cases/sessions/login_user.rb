module Sessions
  class LoginUser
    def initialize(username)
      @username = username
    end
    
    def execute(password)
      user && user.password == password
    end
    
    def user
      @user ||= User.find_by_username(@username)
    end
  end
end
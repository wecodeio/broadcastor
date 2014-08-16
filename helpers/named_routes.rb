module NamedRoutes

  def root_path
    @root_path ||= "/".freeze
  end

  def new_session_path
    @new_session_path ||= File.join(root_path, "login").freeze
  end

  def sessions_path
    @sessions_path ||= File.join(root_path, "sessions").freeze
  end

  def session_path
    @session_path ||= File.join(root_path, "session").freeze
  end

end

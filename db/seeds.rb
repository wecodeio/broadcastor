require "sequel"

require_relative "../config/initializers/sequel"
require_relative "../models/post"

Post.create(:body => 'hola')
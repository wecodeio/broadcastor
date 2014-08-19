require_relative "../config/initializers/sequel"
require_relative "post"

class Channel < Sequel::Model

  one_to_many :posts

end

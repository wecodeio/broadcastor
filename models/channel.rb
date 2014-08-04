require "sequel"

class Channel < Sequel::Model

  one_to_many :posts

end
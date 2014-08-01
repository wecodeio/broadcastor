require "sequel"

require_relative "../config/initializers/sequel"
require_relative "../models/post"

Post.create(:body => 'First post', :created_at => Time.new(2014, 7, 30, 12, 0))
Post.create(:body => 'Second post', :created_at => Time.new(2014, 7, 30, 18, 0))
Post.create(:body => 'Third post', :created_at => Time.new(2014, 7, 31, 6, 0))
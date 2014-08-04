require "sequel"

require_relative "../config/initializers/sequel"
require_relative "../models/post"
require_relative "../models/channel"

programacion = Channel.create(:slug => 'programacion-avanzada', :name => 'Programación Avanzada - UNLaM')

Post.create(:body => 'First post', :created_at => Time.new(2014, 7, 30, 12, 0), :channel_id => programacion.id)
Post.create(:body => 'Second post', :created_at => Time.new(2014, 7, 30, 18, 0), :channel_id => programacion.id)
Post.create(:body => 'Third post', :created_at => Time.new(2014, 7, 31, 6, 0), :channel_id => programacion.id)
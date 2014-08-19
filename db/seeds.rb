require_relative "../models/channel"
require_relative "../models/user"

user = User.create(:username => 'delucas', :password => 'please')

example_channel = Channel.create(:slug => 'example', :name => 'Example')
now = Time.now.utc
five_hours_ago = now - 60*60*5
Post.create(:body => '1st Post', :created_at => five_hours_ago, :channel => example_channel)
Post.create(:body => '2nd Post', :created_at => now, :channel => example_channel)

programacion = Channel.create(:slug => 'programacion-avanzada', :name => 'Programación Avanzada - UNLaM')
Post.create(:body => 'First post', :created_at => Time.new(2014, 7, 30, 12, 0), :channel_id => programacion.id)
Post.create(:body => 'Second post', :created_at => Time.new(2014, 7, 30, 18, 0), :channel_id => programacion.id)
Post.create(:body => 'Third post', :created_at => Time.new(2014, 7, 31, 6, 0), :channel_id => programacion.id)

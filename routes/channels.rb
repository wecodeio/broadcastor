require_relative "base"

module BroadCastor
  module Routes
    class Channels < Base
      connections = Hash.new { |h, k| h[k] = [] }

      connections = Hash.new(Array.new)

      get "/channels/:slug.json" do
        channel = Channel.where(:slug => params[:slug])
        json posts_to_json(Post.where(:channel => channel).sorted_by_date)
      end

      get "/channels/:slug/after/:timestamp.json" do
        channel = Channel.where(:slug => params[:slug])
        json posts_to_json(
          Post.where(:channel => channel).sorted_by_date.created_after(Time.at(params[:timestamp].to_i + 1))
        )
      end

      post '/channels/:slug' do
        channel = Channel.where(:slug => params[:slug]).first
        post = Post.create(:body => params[:body], :created_at => Time.new.utc, :channel_id => channel.id)

        connections[channel.id].each { |out|
          out << "data:" + JSON([post_to_h(post)]) + "\n\n"
        } if connections[channel.id]

        'ok'
      end

      get "/channels/:slug" do
        channel = Channel.where(:slug => params[:slug]).first
        # Get channel with this specific slug, and show it
        haml :"channels/show", locals: { channel: JSON(channel_to_h(channel)) }
      end

      get '/channels/:slug/stream', provides: 'text/event-stream' do
        channel = Channel.where(:slug => params[:slug]).first

        stream :keep_open do |out|
          connections[channel.id] << out
          out.callback {
            connections[channel.id].delete(out)
          }
        end
      end

      private

      def channel_to_h(channel)
        hash = channel.values.dup
        hash.delete(:id)
        hash
      end

      def post_to_h(post)
        hash = post.values.dup
        hash.delete(:id)
        hash.delete(:created_at)
        hash.merge!(timestamp: post.created_at.to_i)
      end

      def posts_to_json(posts)
        posts.map { |post| post_to_h(post) }
      end

    end
  end
end

require_relative "base"

module BroadCastor
  module Routes
    class Channels < Base

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

      get "/channels/:slug" do
        channel = Channel.where(:slug => params[:slug]).first
        # Get channel with this specific slug, and show it
        haml :"channels/show", locals: { channel: JSON(channel_to_h(channel)) }
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

require_relative "base"

module BroadCastor
  module Routes
    class Channels < Base

      get "/channels/:slug.json" do
        json posts_to_json(Post.all)
      end

      get "/channels/:slug/after/:timestamp.json" do
        json [
          {'timestamp' => Time.now.to_i,
           'body' => 'The Next, Next Generation tablet 2.'}
        ]
      end

      get "/channels/:slug" do
        # Get channel with this specific slug, and show it
        haml :"channels/show", locals: { slug: params[:slug] }
      end

      private

      def post_to_h(post)
        hash = post.values.dup
        hash.delete(:id)
        hash.delete(:created_at)
        hash.merge!(timestamp: post.created_at.to_i)
        # sdate = report.start_date ? report.start_date.iso8601 : nil
        # edate = report.end_date ? report.end_date.iso8601 : nil
        # hash.merge!(start_date: sdate, end_date: edate)
      end

      def posts_to_json(posts)
        posts.map { |post| post_to_h(post) }
      end

    end
  end
end

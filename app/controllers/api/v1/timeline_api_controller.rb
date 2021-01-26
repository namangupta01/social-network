module Api
  module V1
    class TimelineApiController < ::ApiController
      before_action :authenticate_user

      api :GET, '/timeline', 'Get Timeline'
      def index
        @posts = @current_user.get_timeline_posts
        Post.set_likes_count @posts
        response_data @posts, 'Timeline Fetched Successfully', 200
      end

    end
  end
end


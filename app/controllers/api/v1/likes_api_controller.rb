module Api
  module V1
    class LikesApiController < ::ApiController
      before_action :authenticate_user
      before_action :check_and_set_post

      api :POST, '/likes', "Toggle like to a post"
      error code: 422, desc: 'Invalid params'
      param :post_id, Integer, desc: "Post Id", required: true, missing_message: "Post Id is required"
      def toggle_like
        liked = Like.toggle_like @post.id, @current_user.id
        data = {
            liked: liked,
            count: @post.get_likes_count
        }
        response_data data, 'Like Successfully Toggled', 200
      end

      private
      def check_and_set_post
        @post = Post.find_by(id: params[:post_id])
        throw_not_found unless @post
      end

    end
  end
end


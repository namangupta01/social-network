module Api
  module V1
    class PostsApiController < ::ApiController
      before_action :authenticate_user
      before_action :check_and_set_post, only: [:show]

      api :POST, '/posts', 'Add a new post'
      param :text, String, desc: 'Post Text Data', required: true, missing_message: 'Post Body is required'
      def create
        post = Post.create(user_id: @current_user.id, body: params[:text])
        Post.set_likes_count [post]
        response_data post, 'Post Successfully Created', 200
      end

      api :GET, '/posts', 'Add a new post'
      param :post_id, String, desc: 'Post Id', required: true, missing_message: 'Post Id is required'
      def show
        response_data @post, 'Successfully Fetched the Post', 200
      end

      private
      def check_and_set_post
        @post = Post.find_by(id: params[:post_id])
        throw_not_found unless @post
      end

    end
  end
end


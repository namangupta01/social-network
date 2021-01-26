module Api
  module V1
    class UserActionsApiController < ::ApiController
      before_action :authenticate_user

      api :POST, '/follow', 'Follow/Unfollow a User'
      error code: 422, desc: 'Invalid params'
      param :uuid, String, :desc => "UUID", required: true
      def toggle_follow
        user = User.find_by(uuid: params[:uuid])
        throw_not_found unless user
        followed = FollowerFolloweeMapping.toggle_follow @current_user.id, user.id
        data = {
            followed: followed
        }
        response_data data, 'Follow Toggle Successful', 200
      end

    end
  end
end


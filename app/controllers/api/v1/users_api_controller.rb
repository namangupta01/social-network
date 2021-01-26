module Api
  module V1
    class UsersApiController < ::ApiController

      api :POST, '/login', 'Login'
      error code: 422, desc: 'Invalid params'
      param :email, String, :desc => 'email', required: true
      param :password, String, :desc => 'password', required: true
      def login
        user = User.find_by(email: params[:email])
        return throw_not_found unless user

        token = user.check_password_and_get_token params[:password]
        response_data({}, 'Password Did not matches', 400, error: Constants::ValidationErrorMessages::UNMATCHED_PASSWORD_ERROR) unless token
        data = {
            token: token
        }
        response_data data, 'Password Matched', 200
      end

    end
  end
end


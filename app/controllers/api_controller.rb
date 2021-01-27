class ApiController < ActionController::API

  include ActionController::HttpAuthentication::Token::ControllerMethods

  rescue_from Apipie::ParamError do |e|
    render json: {error: e.message, status: 422}, status: 422
  end

  private
  def response_data(data, message, status, error:nil, options: {})
    result = {}
    result[:data] = data
    result[:message] = message
    result[:status] = status
    result[:error] = error
    render json: result, options: options
  end

  def authenticate_user
    authenticate_with_http_token do |token, options|
      @current_user = User.get_user_for_token(token) if token
      throw_forbidden unless @current_user
    end
  end

  def throw_not_found
    error = Entities::Error.new 404, 'Not Found'
    return response_data(nil, 'Not Found', 404, error: error)
  end

  def throw_forbidden
    error = Entities::Error.new 403, 'Forbidden'
    return response_data(nil, 'Forbidden', 403, error: error)
  end

end

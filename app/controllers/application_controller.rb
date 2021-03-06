class ApplicationController < ActionController::API
  
  def auth_header_top
    request.headers['Authorization']
  end

  def current_user!
    AuthenticationTokenService.auth_header(auth_header_top)
    @current_user = AuthenticationTokenService.logged_in_user
  end

  def authorized
    AuthenticationTokenService.auth_header(auth_header_top)
    render json: { message: 'Please log in' }, status: :unauthorized unless AuthenticationTokenService.logged_in_user
  end

end
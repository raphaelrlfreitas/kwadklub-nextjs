class UsersController < ApplicationController
  def show
    @user = User.find_by!(id: params[:id])

    render json: {
      user: {
        id: @user.id,
        email: @user.email
      }
    }, status: 200
  end

  def validate_token
    process_token
    
    if @current_user
      render json: {
        user: {
          id: @current_user_id,
          email: @current_user.email
        }
        
      }, status: 200
      
    end
  end

  private

  # Check for auth headers - if present, decode or send unauthorized response (called always to allow current_user)
  def process_token
    if request.headers['Authorization'].present?
      begin
        jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], 'b2401c6b39a98dc6735c1d394b211a4892902883c46f996d2b255e09bff6a3346e3f3f60e702b7eb04c31f190f4d3057fd4ffce92f8ffcaf59ee8504d04642a6').first
        @current_user_id = jwt_payload['user_id'].to_i
        @current_user = User.find(@current_user_id)
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end

  # If user has not signed in, return unauthorized response (called only when auth is needed)
  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  # set Devise's current_user using decoded JWT instead of session
  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  # check that authenticate_user has successfully returned @current_user_id (user is authenticated)
  def signed_in?
    @current_user_id.present?
  end
end
  
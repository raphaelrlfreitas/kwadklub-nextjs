class RegistrationsController < Devise::RegistrationsController
  skip_before_action :verify_authenticity_token, :only => :create

  def create
    @user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])

    if @user.save!
      token = @user.generate_jwt

      render json: token.to_json, status: :created
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: 422
    end
  end
end

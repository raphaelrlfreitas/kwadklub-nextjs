class ProfilesController < ApiController
  def index
    if params[:username]
      @profile = Profile.find_by!(username: params[:username])

      render json: {
        status: 200,
        profile: @profile
      }
    else
      @profiles = Profile.all

      render json: {
        status: 200,
        profiles: @profiles
      }
    end
  end

  def show
    @profile = Profile.find(params[:id])

    render json: {
      status: 200,
      profile: @profile
    }
  end

  def update
    @profile = Profile.find_by!(id: params[:id])
    @profile.update_attributes()
  end

  def create
    Profile.create!(username: params[:username])
  end

  def find_by_username
    req = JSON.parse(params[:username])
    byebug

    @profile = Profile.find_by!(username: params[:username])
  end

  private

  def profile_params

    params.require(:profile).permit(:id, :username, :cover_picture, :profile_picture, :bio)
  end

end

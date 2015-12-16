#
class ProfilesController < OpenReadController
  before_action :set_profile, only: [:update, :destroy]

  # GET /profiles
  def index
    if current_user
      @profiles = current_user.profile
    else
      @profiles = Profile.all
    end
    render json: @profiles
  end

  # GET /profiles/1
  def show
    render json: current_user.profile
  end

  # POST /profiles
  def create
    @profile = current_user.build_profile(profile_params)
    # current_user.profiles.new(profile_params) #makes this, this user's profile
    @profile.save
    if @profile.save
      render json: @profile, status: :created, location: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  def show_current
    @profile = Profile.findby current_user: :user_id
    render json: @profile
  end
  # PATCH /profiles/1
  def update
    if @profile.update(profile_params)
      head :no_content
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy

    head :no_content
  end

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:username, :studio, :website, :user_id)
  end

  private :set_profile, :profile_params
end

#
class AuthController < ApplicationController
  #######You need line 4 and 5 for registering#####
  skip_before_action :authenticate, only: [:login, :register]

  # POST /login
  def login
    @user = User.authenticate credentials[:email], credentials[:password]
    if @user
      render json: @user, serializer: LoginUserSerializer, root: 'user'
    else
      head :unauthorized
    end
  end

  # POST /register
  def register
    @user = User.create(credentials)

    if @user.valid?
      profile_params = { :user_id => @user.id}
      profile = @user.build_profile(profile_params)
      profile.save

      if profile.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /logout/1
  #####This keeps a user from being able to log a different user out
  def logout
    if current_user == User.find(params[:id])
      current_user.logout
      head :no_content
    else
      head :unauthorized
    end
  end

  def credentials
    params.require(:credentials).permit(:email,
                                        :password,
                                        :password_confirmation)
  end

  private :credentials
end

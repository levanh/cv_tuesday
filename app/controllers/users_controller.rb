class UsersController < ApplicationController
  def new
		@user = User.new
  end

	def show
		@user = User.find(params[:id])
	end

  def create
    @user = User.new(user_params)
  	@user.cv = params[:cv]
    if @user.save
			flash[:success] = "Vous avez créé votre profil avec succès."
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :birthdate,
																	 :weight, :ideal_weight, :sporty,
																	 :email,
                                   :password, :password_confirmation,
																	 :cv)
    end
end

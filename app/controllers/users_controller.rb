class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :delete]
  before_action :correct_user, only: [:edit, :update, :show]
  before_action :detect_devise_variant

  def index
    #@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

<<<<<<< HEAD
 def favorite
      @user = User.find(params[:id])
      @doctor = current_doctor
      @user.favorites.create(doctor: @doctor)
      @user.save
      redirect_to @user
  end


=======
>>>>>>> 8e8e1ad165ff0211b4502d055cb1561fa0495e4d
  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
<<<<<<< HEAD
      @doctor = current_doctor
      redirect_to root_url unless current_user?(@user) or current_doctor?(@doctor)
    end

    def correct_doctor
      signed_in_doctor
      redirect_to root_url
    end


=======
      redirect_to root_url unless current_user?(@user)
    end

>>>>>>> 8e8e1ad165ff0211b4502d055cb1561fa0495e4d
    def detect_devise_variant
            case request.user_agent
            when /iPad/
                request.variant = :tablet
            when /iPhone/
                request.variant = :mobile
            end
    end

end

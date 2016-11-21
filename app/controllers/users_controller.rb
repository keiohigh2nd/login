class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :delete]
  before_action :correct_user, only: [:edit, :update, :show]
  #before_action :correct_doctor, only: [:edit, :update, :show]
  #before_action :detect_devise_variant

  def index
      @users = current_doctor.users
      @users = @users.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    f = File.open("data/note_#{@user.id}.txt", "w")
    for un in @user.notes
      f.puts un.note
    end
    f.close
    if signed_in_doctor?
      @doctors = @user.doctors
      @doctor = current_doctor
      if not @doctors.exists?(@doctor)
        redirect_to doctors_url
      end
    end
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
      redirect_to controller: 'users', action: 'introduction', id: @user.id
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

 def favorite
      @user = current_user
      @doctor = Doctor.find(params[:id])
      @user.favorites.create(doctor: @doctor)
      @user.save
      redirect_to @user
  end

  def introduction
      @user = User.find(params[:id])
      @doctors = Doctor.all
  end

  def recommendation
      @user = User.find(params[:id])
      @doctors = Doctor.all
  end

  def summary
      @user = User.find(params[:user_id])
      @text = "-------"
  end    

  def collect_screen
     screen = current_user.screenings.build(title: params[:title], score: params[:check])
     screen.save
     redirect_to current_user
  end
 
  private

    def user_params
      params.require(:user).permit(:name, :age, :sex, :email, :emergence, :adress, :password, :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      @doctors = @user.doctors
      if signed_in_doctor?
        @doctor = current_doctor
        if not @doctors.exists?(:id => @doctor.id)
          redirect_to root_url unless current_user?(@user) or signed_in_doctor 
        end
      else
        redirect_to root_url unless current_user?(@user)
      end
                                           
      #This part decides who to watch the show page
      #redirect_to root_url unless current_user?(@user) or current_doctor?(@doctor)
    end

    def correct_doctor
      @user = User.find(params[:id])
      @doctors = @user.doctors
      @doctor = current_doctor
      if not @doctors.exists?(@doctor)
        redirect_to root_url
      else
        redirect_to @user
      end
    end

    def detect_devise_variant
            case request.user_agent
            when /iPad/
                request.variant = :tablet
            when /iPhone/
                request.variant = :mobile
            end
    end

end

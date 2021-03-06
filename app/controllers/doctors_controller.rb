class DoctorsController < ApplicationController
  before_action :signed_in_doctor, only: [:edit, :update]
  before_action :correct_doctor, only: [:edit, :update]
  require 'important_order'

  def index
    @doctors = Doctor.search(params[:search])
  end

  def show
    @doctor = Doctor.find(params[:id])
    @ordered_users = order(@doctor.users)
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def find_similar
    @user = User.find(params[:id])
    sim_id = @user.id
    File.open("build/similar_list.txt") do |file|
      file.each_line do |line| 
        p line[0]
        if line[1] == @user.id
          sim_id = line[0]
          break
        end
      end
    end 
    redirect_to User.find(sim_id)
  end

  def open
    @doctor = Doctor.find(params[:id])
    @doctor.openflag = 1
    @doctor.save
    redirect_to @doctor
  end

  def close
    @doctor = Doctor.find(params[:id])
    @doctor.openflag = 0
    @doctor.save
    redirect_to @doctor
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      sign_in @doctor
      redirect_to @doctor
    else
      render 'new'
    end
  end

  def update
    if @doctor.update_attributes(doctor_params)
      redirect_to @doctor
    else
      render 'edit'
    end
  end

  private

    def doctor_params
      params.require(:doctor).permit(:name, :email, :password, :password_confirmation, :speciality, :adress)
    end

    def correct_doctor
      @doctor = Doctor.find(params[:id])
      redirect_to root_url unless current_doctor=(@doctor)
    end
end

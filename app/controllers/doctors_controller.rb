class DoctorsController < ApplicationController
  before_action :signed_in_doctor, only: [:edit, :update]
  before_action :correct_doctor, only: [:edit, :update]

  def index
    @doctors = Doctor.search(params[:search])
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
  end

  def edit
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

class DSessionsController < ApplicationController
  def new
    if signed_in_doctor?
      doctor = current_doctor
      redirect_to doctor
    end
  end

  def create
    doctor = Doctor.find_by(email: params[:dsession][:email].downcase)
    if doctor && doctor.authenticate(params[:dsession][:password])
      sign_in_doctor doctor
      redirect_to doctor
    else
      render 'new'
    end
  end

  def destroy
    sign_out_doctor
    redirect_to root_url
  end
end

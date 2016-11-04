module DSessionsHelper
def sign_in_doctor(doctor)
    remember_token = Doctor.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    doctor.update_attribute(:remember_token, Doctor.encrypt(remember_token))
    self.current_doctor = doctor
  end

  def sign_out_doctor
    self.current_doctor = nil
    cookies.delete(:remember_token)
  end

  def current_doctor=(doctor)
    @current_doctor = doctor
  end

  def current_doctor
    remember_token = Doctor.encrypt(cookies[:remember_token])
    @current_doctor ||= Doctor.find_by(remember_token: remember_token)
  end

  #def current_doctor(doctor)
    #doctor == current_doctor
  #end
  def current_doctor?(doctor)
    doctor == current_doctor
  end

  def signed_in_doctor?
    !current_doctor.nil?
  end

  def signed_in_doctor
    redirect_to signin_doctor_url unless signed_in_doctor?
  end
end

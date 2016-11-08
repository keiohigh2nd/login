class SessionsController < ApplicationController
  before_action :detect_devise_variant
  def new
    if signed_in?
      user = current_user
      redirect_to user
    end
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    #user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to new_session_path
  end

  private
    def detect_devise_variant
            case request.user_agent
            when /iPad/
                request.variant = :tablet
            when /iPhone/
                request.variant = :mobile
            end
    end
end

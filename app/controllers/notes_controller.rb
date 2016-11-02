class NotesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @note = @user.notes.create(note_params)
    @text = params[:note]
    @push = @user.pushs.new()
    @push.save
    redirect_to user_path(@user)
  end

  private
    def note_params
      params.require(:note).permit(:note, :flag)
    end

end

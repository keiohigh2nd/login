class NotesController < ApplicationController
  require 'load'
  def create
    @user = User.find(params[:user_id])
    @note = @user.notes.create(note_params)
    @text = params[:note]
    @answer = answer(@text[:note])

    if not @answer == 0
      ans = @user.notes.build(note: @answer, flag: 3)
      ans.save
    end
    @push = @user.pushs.new()
    @push.save
    redirect_to user_path(@user)
  end

  private
    def note_params
      params.require(:note).permit(:note, :flag)
    end

end

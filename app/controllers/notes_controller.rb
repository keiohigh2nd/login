class NotesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @note = @user.notes.create(note_params)
    redirect_to user_path(@user)
  end

  private
    def note_params
<<<<<<< HEAD
      params.require(:note).permit(:note, :flag)
=======
      params.require(:note).permit(:note)
>>>>>>> 8e8e1ad165ff0211b4502d055cb1561fa0495e4d
    end
end

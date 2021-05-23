class NotesController < ApplicationController

  def index
  end

  def create
    @note = current_user.notes.create(note_params)
    if @note.save
      redirect_to note_path(current_user)
    else
      render note_path(current_user), notice:'You just made a new note.'
    end
  end

  def show
    @user = User.find(params[:id])
    @note = Note.new
    # @note = Note.find(params[:id])
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to note_path(current_user), notice: "Your note has been deleted."
  end

  def edit
    @note = Note.find(params[:id])
    @user = @note.user
  end

  def update
    @note = Note.find(params[:id])
    @note.update(note_params)
    if @note.save
      redirect_to note_path(current_user)
    else
      render note_path(current_user), notice: "Your note has been updated."
    end
  end

  private
    def note_params
      params.require(:note).permit(:content)
    end


end

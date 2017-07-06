class NotesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.user = current_user
    if @note.save
      NoteMailer.new_note(@note).deliver_now
      redirect_to notes_path
    else
      render new
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_path
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(notes_params)
      redirect_to notes_path
    else
      render :edit
    end
  end

  def edit
  end


  def like
    @note = Note.find(params[:id])
    @like = @note.likes.new
    @like.user = current_user
    if @like.save
      redirect_to notes_path
    end
  end

  def unlike
    @note = Note.find(params[:id])
    @like = @note.likes.find_by(user_id: current_user.id)
    @like.destroy
    redirect_to notes_path
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end

end

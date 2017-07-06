class NoteMailer < ApplicationMailer

  def new_note(note)
    @note = note
    @user = User.find(@note.user_id)

    mail to: @user.email
  end


end

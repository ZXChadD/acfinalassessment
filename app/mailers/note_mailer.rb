class NoteMailer < ApplicationMailer

  def new_note(note)
    @note = note
    @user = User.find(@note.user_id)

    mail(to: @user.email, subject: 'New Note')
  end

  def new_like(like)
    @like = like
    @note = @like.note
    @user = User.find(@note.user_id)

    mail(to: @user.email, subject: 'New Like')
  end


end

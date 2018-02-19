class CommentsController < ApplicationController
  before_action :authenticate, except: :index

  def create
    comment = Comment.create(comment_val)
    if !comment.valid?
      flash[:errors] = comment.errors.full_messages
    else
      event = Event.find(params[:id])
      user = User.find(session[:user_id])
      user.comments << comment
      event.comments << comment
    end
    return redirect_to(:back)


  end
end

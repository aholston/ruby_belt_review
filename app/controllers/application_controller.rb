class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate
    if !session[:user_id]
      return redirect_to '/'
    else
      return
    end
  end


  def user_val
    params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation)
  end

  def event_val
    params.require(:event).permit(:name, :city, :state, :date)
  end

  def comment_val
    params.require(:comment).permit(:content)
  end



end

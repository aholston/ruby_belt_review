class SessionsController < ApplicationController
  def create
    if User.find_by_email(user_val[:email]).try(:authenticate, user_val[:password])
      user = User.find_by_email(user_val[:email])
      session[:user_id] = user.id
      return redirect_to '/events'
    else
      flash[:errors] = 'Invalid Combination'
      return redirect_to '/users'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end

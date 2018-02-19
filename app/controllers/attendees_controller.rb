class AttendeesController < ApplicationController
  before_action :authenticate, except: :index

  def create
    user = User.find(session[:user_id])
    event = Event.find(params[:id])
    attendee = Attendee.create(user: user, event: event)
    if !attendee.valid?
      flash[:errors] = attendee.errors.full_messages
    end
    return redirect_to '/events'

  end

  def destroy
    puts params
    user = User.find(session[:user_id])
    event = Event.find(params[:id])
    user.events_attending.delete(event)
    return redirect_to '/events'

  end
end

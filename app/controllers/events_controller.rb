class EventsController < ApplicationController
  before_action :authenticate

  def index
    @user = User.find(session[:user_id])
    @events = Event.all
  end

  def show
    @user = User.find(session[:user_id])
    @event = Event.find(params[:id])
    @comments = @event.comments
  end

  def create
    p session[:user_id]
    @user = User.find(session[:user_id])
    event = Event.create(event_val)
    @user.events << event
    if !event.valid?
      flash[:errors] = event.errors.full_messages
    end
    return redirect_to '/events'
  end

  def edit
    @event = Event.find(params[:id])
    @user = User.find(session[:user_id])
  end

  def update
    event = Event.find(params[:id])
    event.update(event_val)
    p event
    if event.valid?
      event.save
      return redirect_to '/events'
    else
      flash[:errors] = event.errors.full_messages
      return redirect '/events/'+event.id+'/edit'
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to '/events'
  end
end

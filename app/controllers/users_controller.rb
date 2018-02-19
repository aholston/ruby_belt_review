class UsersController < ApplicationController

  before_action :authenticate, except: [:index, :create]


  def index

  end

  def new
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def show
  end

  def create
    user = User.new(user_val)
    p user.valid?
    if user.valid?
      user.save
      session[:user_id] = user.id
      return redirect_to '/events'
    else
      flash[:errors] = user.errors.full_messages
      return redirect_to '/users'
    end

  end

  def update
    @user = User.find(session[:user_id])
    @user.update(user_val)
    if @user.valid?
      @user.save
      return redirect_to '/events'
    else
      flash[:errors] = @user.errors.full_messages
      return redirect_to "/users/#{@user.id}/edit"
    end
  end






end

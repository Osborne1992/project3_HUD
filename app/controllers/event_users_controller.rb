class EventUsersController < ApplicationController

  load_and_authorize_resource

  before_action :find_event

  def new
    @event_user = @event.event_users.build
  end

  def create
    @event_user = @event.event_users.build(event_user_params)
    if @event_user.save
      redirect_to @event_user.event
    else
      render 'new'
    end
  end

  def destroy
    event_user = @event.event_users.find(params[:id])
    event_user.destroy
    redirect_to(@event)
  end

  def find_event
    @event = Event.find(params[:event_id])
  end

  def event_user_params
    params.require(:event_user).permit(:user_id)
  end

end
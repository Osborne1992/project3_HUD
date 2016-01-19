class EventsController < ApplicationController

  load_and_authorize_resource

  def index
    @events = Event.all.order(:name)
  end

  def show
    @event = find_event
  end

  def new
    @event = Event.new
  end

  def create
    event = Event.create(event_params)
    event.creator_id = current_user.id if current_user
    redirect_to( event_path( event.id ) )
  end

  def destroy
    event = find_event
    event.destroy
    redirect_to(events_path)
  end

  def edit
    @event = find_event
  end

  def update
    event = find_event
    event.update(event_params)
    redirect_to(event_path(event.id))
  end

  private

  def find_event
    Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :host, :creator_id, :start_date, :start_time, :end_date, :end_time, :description, :private, :location)
  end

  # comment = commentable.comments.create
  # comment.title = "First comment."
  # comment.comment = "This is the first comment."
  # comment.save

end
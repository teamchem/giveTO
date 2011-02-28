class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    #@organization = User.find(params[@user.id])
  end

  def new
    @event = Event.new
    @title = "New event"
  end
  
  def create
    @event = Event.new(params[:event])
    
    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      @title = "New event"
      render 'new'
    end
  end
  
  def calendar
    
  end
  
  def all
    @title = "All events"
    @events = Event.all(:order => 'start_time')
  end
end

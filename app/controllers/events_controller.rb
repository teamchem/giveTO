class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    #@organization = User.find(params[@user.id])
  end

  def new
    @title = "New event"
  end
  
  def calendar
    
  end
  
  def all
    @title = "All events"
    @events = Event.all
  end
  
  def create
    @event = Event.new(params[:event])
    
    if @event.save
      flash[:success] = "Event created!"
      redirect_to @event
    else
      @title = "Sign up"
      render 'new'
    end
  end
end

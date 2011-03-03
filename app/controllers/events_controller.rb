class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @title = @event.name
    #@organization = User.find(params[@user.id])
  end

  def new
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
    @title  = "Calendar"
    @date_string = params[:date]
    @date   = DateTime.strptime(str = @date_string, fmt = '%m%Y')
    @minus1year  = @date - 1.year
    @minus1month = @date - 1.month
    @plus1month  = @date + 1.month
    @plus1year   = @date + 1.year

    @events = Event.find(:all, :order => 'start_time', 
                         :conditions => ['start_time >= ? AND end_time <= ?', 
                                               @date.beginning_of_month,
                                               @date.end_of_month] )
  end
  
  def all
    @title = "All events"
    @events = Event.all(:order => 'start_time')
  end
end

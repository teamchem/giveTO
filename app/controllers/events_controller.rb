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
    @title  = "Calendar"
    #date_string = "022011"
    @date   = DateTime.strptime(str = @date_string, fmt = '%m%Y')
    @minus1year  = @date - 1.year
    @minus1month = @date - 1.month
    @plus1month  = @date + 1.month
    @plus1year   = @date + 1.year

    @events = Event.find(:all, :order => 'start_time', 
                         :conditions => ['start_time >= ? AND end_time <= ?', 
                                               @date.beginning_of_month,
                                               @date.end_of_month] )
<<<<<<< HEAD
                                               
   common_year_days_in_month = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
   def days_in_month(month, year = Time.now.year)
      return 29 if month == 2 && Date.gregorian_leap?(year)
      common_year_days_in_month[month]
   end
=======
>>>>>>> e1fa15377a028abe9d1cd8f9d4491dfa58d3a015
  end
  
  def all
    @title = "All events"
    @events = Event.all(:order => 'start_time')
  end
end

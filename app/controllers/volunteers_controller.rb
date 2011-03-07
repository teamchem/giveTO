class VolunteersController < ApplicationController
  before_filter :authenticate
  
  def create
    @event = Event.find(params[:volunteer][:event_id])
    current_user.attend!(@event)
    redirect_to "/events/show/#{@event.id}"
  end
  
end

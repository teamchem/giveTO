class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def new
  end
end

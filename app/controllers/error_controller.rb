class ErrorController < ApplicationController
  def routing
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
  
  def pass_calendar_date
    redirect_to "/events/calendar/#{DateTime.now.strftime('%m%Y')}"
  end
end

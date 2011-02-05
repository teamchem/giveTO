class Event < ActiveRecord::Base
  attr_accessible :name, :location, :start_time, :end_time
end

# == Schema Information
# Schema version: 20110224000659
#
# Table name: events
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  organization      :integer
#  location          :string(255)
#  start_time        :datetime
#  end_time          :datetime
#  volunteers_needed :integer
#  created_at        :datetime
#  updated_at        :datetime
#  rso_type          :string(255)
#

class Event < ActiveRecord::Base
  attr_accessible :name, :location, :start_time, :end_time
end

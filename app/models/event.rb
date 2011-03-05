# == Schema Information
# Schema version: 20110228211247
#
# Table name: events
#
#  id                :integer         not null, primary key
#  name              :string(255)
#  organization      :string(255)
#  location          :string(255)
#  start_time        :datetime
#  end_time          :datetime
#  volunteers_needed :integer
#  created_at        :datetime
#  updated_at        :datetime
#  rso_type          :string(255)
#  description       :string(255)
#

class Event < ActiveRecord::Base
  attr_accessible :name, :organization, :location, :start_time, :end_time, :end_time, :volunteers_needed, :rso_type, :description

  has_many :attendees, :foreign_key => "user_id", :class_name => "Volunteer", :dependent => :destroy
  has_many :users, :through => :attendees

  def month
    return start_time.month
  end
end

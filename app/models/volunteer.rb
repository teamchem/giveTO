# == Schema Information
# Schema version: 20110304044356
#
# Table name: volunteers
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  event_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Volunteer < ActiveRecord::Base
  attr_accessible :event_id
  
  belongs_to :user, :class_name => "User"
  belongs_to :event, :class_name => "Event"
  
  validates :user_id,  :presence => true,
                       :length => { :minimum => 1 }
                      
  validates :event_id, :presence => true,
                       :length => { :minimum => 1 }
end

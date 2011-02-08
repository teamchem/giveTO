# == Schema Information
# Schema version: 20110202040623
#
# Table name: organizations
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  user       :integer
#  type       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Organization < ActiveRecord::Base
  
end

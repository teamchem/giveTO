# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Event.create(:name => 'Story Time', 
			 :organization => 'Happy Hands', :location => '123 Sesame Street', 
			:start_time => DateTime.now, :end_time => DateTime.now + 5.hours, :volunteers_needed => 5, 
<<<<<<< HEAD
			:rso_type => 'Business', :description => "Let's read some books!")
=======
			:rso_type => 'Business', :description => "Let's read some books!")
			
>>>>>>> e1fa15377a028abe9d1cd8f9d4491dfa58d3a015

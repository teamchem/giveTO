# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Event.create(
            :name => 'Story Time', 
			      :organization => 'TestOrg', 
			      :location => '123 Sesame Street', 
			      :start_time => DateTime.now, 
			      :end_time => DateTime.now + 5.hours, 
			      :volunteers_needed => 5, 
			      :rso_type => 'Business', 
			      :description => "Let's read some books!",
			      :user_id => User.first.id
            )
            
Event.create(
            :name => 'Baking Time', 
			      :organization => 'TestOrg', 
			      :location => '123 Sesame Street', 
			      :start_time => DateTime.now + 1.minute, 
			      :end_time => DateTime.now + 5.hours + 1.minute, 
			      :volunteers_needed => 10, 
			      :rso_type => 'Business', 
			      :description => "Let's bake some cakes!",
			      :user_id => User.first.id
            )
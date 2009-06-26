class AddDefaultUser < ActiveRecord::Migration
self.up
  if !User.find_by_login('admin')
    User.create(:login => 'admin', :email => 'edonle@gmail.com', 
                :password => 'changeme', :password_confirmation => 'changeme')
  end
end
end

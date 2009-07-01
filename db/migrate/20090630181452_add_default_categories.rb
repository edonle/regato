class AddDefaultCategories < ActiveRecord::Migration
  def self.up
    Category.create :title => "Tecnologia"
    Category.create :title => "Esporte"
    Category.create :title => "Portal"	    
  end

  def self.down
    Category.delete_all	  
  end
end

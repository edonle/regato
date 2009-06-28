class CategorySiteJoin < ActiveRecord::Migration
  
  create_table :categories_sites, :id => false do |t|
    t.integer :category_id
    t.integer :site_id
  end


  def self.down
    drop_table :categories_sites
  end
end

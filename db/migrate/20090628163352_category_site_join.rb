class CategorySiteJoin < ActiveRecord::Migration
  def self.up  
  create_table :categories_sites, :id => false do |t|
    t.integer :category_id
    t.integer :site_id
  end
  end

  def self.down
    drop_table :categories_sites
  end
end

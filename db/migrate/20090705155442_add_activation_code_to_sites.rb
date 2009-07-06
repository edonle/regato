class AddActivationCodeToSites < ActiveRecord::Migration
  def self.up
    add_column :sites, :activation_code, :string, :limit => 40
    add_column :sites, :activated_at, :datetime
  end

  def self.down
    remove_column :sites, :activation_code
    remove_column :sites, :activated_at
  end
end

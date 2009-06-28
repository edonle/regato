class Site < ActiveRecord::Base
  has_and_belongs_to_many :categories
  validates_presence_of :url
end

namespace :db do
  desc "Apaga e gera dados de testes"
  
  task :populate => :environment do
    require 'populator'    
    
    Site.delete_all
    Tag.delete_all
    Tagging.delete_all
    
    Site.populate 800 do |site|
      site.url = "http://m." + Populator.words(1) + ".com"
      site.name = Populator.words(3).titleize
      site.description = Populator.sentences(5)
      site.created_at = 2.years.ago..Time.now
      site.updated_at = 2.years.ago..Time.now
    end
    
    Tag.populate 120 do |tag|
      tag.name = Populator.words(1)
    end
    
    Tagging.populate 2000 do  |tagging|
      tagging.tag_id = 1..120
      tagging.taggable_id = 1..800
      tagging.taggable_type = "Site"
      tagging.context = "tags"
      tagging.created_at = 2.years.ago..Time.now
    end
  end
end
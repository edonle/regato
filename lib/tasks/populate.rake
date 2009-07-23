namespace :db do
  desc "Apaga e gera dados de testes"
  
  task :populate => :environment do
    require 'populator'
    
    Site.delete_all
    
    Site.populate 3000 do |site|
      site.url = "http://m." + Populator.words(1) + ".com"
      site.name = Populator.words(3).titleize
      site.description = Populator.sentences(5)
      site.created_at = 2.years.ago..Time.now
      site.updated_at = 2.years.ago..Time.now
    end
  end
end
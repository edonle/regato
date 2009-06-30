class AddDefaultSites < ActiveRecord::Migration
  def self.up
    Site.create :url => "www.uol.com.br"
#	:description => "Portal de conteúdo"

    Site.create :url => "www.globo.com"
 #   	:description => "Portal de noticias"

    Site.create :url => "www.idgnow.com.br"
#	:description => "Tudo sobre tecnologia"
  end

  def self.down
    Site.delete_all	  
  end
end

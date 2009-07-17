class Site < ActiveRecord::Base
	
	acts_as_taggable_on :tags

	has_and_belongs_to_many :categories
  
	validates_presence_of :url
  
	  validates_each :url, :on => :create do |record, attr, value|
		begin
		  uri = URI.parse(value)
		  if uri.class != URI::HTTP
			record.errors.add(attr, 'Somente o protocolo HTTP � aceito.')
		  end
		rescue URI::InvalidURIError
		  record.errors.add(attr, 'O formato da url n�o � valido.')
		end
	  end
  
	before_create :make_activation_code  

	# Ativa o site no banco de dados.
	def activate
		@activated = true
		self.activated_at = Time.now.utc
		self.activation_code = nil
		save(false)
	end

	def active?
		# A exist�ncia do activation code significa que o site n�o foi ativado ainda
		activation_code.nil?
	end

	def make_activation_code
		self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
	end
end
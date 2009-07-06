class Site < ActiveRecord::Base
  has_and_belongs_to_many :categories
  validates_presence_of :url
  
  before_create :make_activation_code  
  
  # Activates the announcement in the database.
  def activate
    @activated = true
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(false)
  end

  def active?
    # the existence of an activation code means they have not activated yet
    activation_code.nil?
  end
  
  def make_activation_code
    self.activation_code = Digest::SHA1.hexdigest( Time.now.to_s.split(//).sort_by {rand}.join )
  end
end

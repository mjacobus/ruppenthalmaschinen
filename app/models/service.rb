class Service < ActiveRecord::Base
  has_many :pictures, :as => :imageable, :order => :sequence
  
  attr_accessible :title, :description, :slug, :enabled, :home
  
  
  validates :title, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :slug, :presence => true
  validates :description, :presence => true
  
  
  # set title and slug
  def title=(new_title)
    super(new_title)
    self[:slug] = new_title.parameterize if new_title
  end
  
  def self.enabled
    where(:enabled => true)
  end
  
  def self.on_home_page
    where(:home => true)
  end
  
end

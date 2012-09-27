class Service < ActiveRecord::Base
  attr_accessible :title, :description, :slug, :enabled
  
  validates :title, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :slug, :presence => true
  validates :description, :presence => true
  validates :enabled, :presence => true
  
  
  # set title and slug
  def title=(new_title)
    super(new_title)
    self[:slug] = new_title.parameterize if new_title
  end
  
end

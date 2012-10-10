class Category < ActiveRecord::Base
  attr_accessible :name, :slug
  
  has_many :products
  
  validates :name,
    :presence => true,
    :uniqueness => {:case_sensitive => false}
    
  validates :slug, :presence => true
  
  def name=(new_name)
    super(new_name)
    self[:slug] = name.parameterize if name?
  end
end

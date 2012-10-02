class ProductType < ActiveRecord::Base
  attr_accessible :description, :name, :sequence, :slug
  
  validates :name,
    :presence => true,
    :uniqueness => {:case_sensitive => false}
  validates :sequence,
    :presence => true,
    :numericality => {:only_integer => true}
    
  def name=(new_name)
    super(new_name)
    self[:slug] = name.parameterize if name?
  end
    
end

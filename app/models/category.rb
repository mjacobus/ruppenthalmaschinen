class Category < ActiveRecord::Base
  attr_accessible :name, :slug
  
  has_many :products
  
  validates :name,
    :presence => true,
    :uniqueness => {:case_sensitive => false}
    
  validates :slug, :presence => true
  
  # prevent exclusion of categories with products
  before_destroy do |category|
    category.products.empty?
  end
  
  def name=(new_name)
    super(new_name)
    self[:slug] = name.parameterize if name?
  end
end

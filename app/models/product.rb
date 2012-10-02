class Product < ActiveRecord::Base
  attr_accessible :application, :name, :slug, :type_id, :enabled
  
  has_many :pictures, :as => :imageable
  belongs_to :type, :class_name => :ProductType
  
  
  validates :name, :presence => true,
    :uniqueness => {:case_sensitive => false}
    
  validates :application, :presence => true
  
  def name=(new_name)
    super(new_name)
    self[:slug] = name.parameterize if name?
  end
  
  def self.enabled
    where(:enabled => true)
  end
  
end

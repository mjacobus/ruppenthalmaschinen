class Product < ActiveRecord::Base
  attr_accessible :application, :name, :slug,
    :type_id, :enabled, :category_id, :home, :video
  
  has_many :pictures, :as => :imageable, :order => :sequence
  has_many :features, :order => :sequence
  belongs_to :type, :class_name => :ProductType
  belongs_to :category
  
  validates :type, :presence => true
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
  
  def self.on_home_page
    where(:home => true)
  end
  
end

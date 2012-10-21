class Feature < ActiveRecord::Base
  belongs_to :product
  attr_accessible :name, :value, :product_id, :sequence
  
  validates :name,
    :presence => true,
    :uniqueness => {:case_sensitive => false, :scope => :product_id}
  validates :value, :presence => true
  
end

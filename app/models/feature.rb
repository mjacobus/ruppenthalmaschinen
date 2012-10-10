class Feature < ActiveRecord::Base
  belongs_to :product
  attr_accessible :name, :value, :product_id
  
  validates :name,
    :presence => true,
    :uniqueness => {:case_sensitive => false}
  validates :value, :presence => true
  
end

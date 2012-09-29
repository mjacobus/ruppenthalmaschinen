class ProductType < ActiveRecord::Base
  attr_accessible :description, :name, :sequence
  
  validates :name,
    :presence => true,
    :uniqueness => {:case_sensitive => false}
  validates :sequence,
    :presence => true,
    :numericality => {:only_integer => true}
end

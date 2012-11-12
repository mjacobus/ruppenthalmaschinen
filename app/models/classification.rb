class Classification < ActiveRecord::Base
  attr_accessible :name, :sequence
  
  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}
  validates :sequence, :numericality => {:only_integer => true}
end

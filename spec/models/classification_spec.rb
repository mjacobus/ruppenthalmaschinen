require 'spec_helper'

describe Classification do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_numericality_of(:sequence).only_integer }
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:sequence) }
end

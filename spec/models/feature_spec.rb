# encoding: UTF-8
require 'spec_helper'

describe Feature do
  it {should validate_presence_of(:name)}
  
  describe "uniqueness validation of name scoped to product_id" do
    subject do
      feature = Feature.create!(:product_id => Factory.create(:product).id,
                                :name => 'height',
                                :value => '1mt')
      new_feature = Factory.build(:feature,
                                  :product => feature.product,
                                  :name => feature.name.upcase)
      new_feature
    end
    
    it { should_not be_valid }
    it { should have(1).errors_on(:name) }
  end
  
  it {should validate_presence_of(:value)}
  it {should belong_to(:product)}
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:value) }
  it { should allow_mass_assignment_of(:sequence) }
  it { should allow_mass_assignment_of(:product_id) }
end

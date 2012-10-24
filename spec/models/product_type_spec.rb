require 'spec_helper'

describe ProductType do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_presence_of(:sequence) }
  it { should validate_numericality_of(:sequence).only_integer }
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:slug) }
  it { should allow_mass_assignment_of(:sequence) }
  
  describe "#slug" do
    subject { Factory.build(:product_type, :name => 'A Title') }
    it {should be_valid}
    its(:name) {should == 'A Title'}
    its(:slug) {should == 'a-title'}
  end
  
  it {should have_many(:products)}
  
  it "should not be destroyed when has products" do
    Factory(:product, :type => Factory(:product_type)).type.destroy.should be_false
  end
  
  it "should not be destroyed when has no products" do
    type = Factory(:product_type)
    lambda {
      type.destroy  
    }.should change(ProductType,:count).by(-1)
  end
end

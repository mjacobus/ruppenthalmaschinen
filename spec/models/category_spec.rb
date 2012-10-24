require 'spec_helper'

describe Category do
  
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name).case_insensitive}
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:slug) }
  
  describe "#slug" do
    subject { Factory.build(:category, :name => 'A Category') }
    it {should be_valid}
    its(:name) {should == 'A Category'}
    its(:slug) {should == 'a-category'}
  end
  
  it {should have_many(:products)}
  
  it "should not be destroyed when has products" do
    Factory(:product, :category => Factory(:category)).category.destroy.should be_false
  end
  
  it "should not be destroyed when has no products" do
    category = Factory(:category)
    lambda {
      category.destroy  
    }.should change(Category,:count).by(-1)
  end
end

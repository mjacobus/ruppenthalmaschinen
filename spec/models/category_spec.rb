require 'spec_helper'

describe Category do
  
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name).case_insensitive}
  it {should have_many(:products)}
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:slug) }
  
  describe "#slug" do
    subject { Factory.build(:category, :name => 'A Category') }
    it {should be_valid}
    its(:name) {should == 'A Category'}
    its(:slug) {should == 'a-category'}
  end
end

require 'spec_helper'

describe Product do
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name).case_insensitive}
  it {should validate_presence_of(:application)}
  it {should belong_to(:type).class_name(ProductType)}
  it {should have_many(:pictures)}
  
  
  describe "#slug" do
    subject { Factory.build(:product, :name => 'A Title') }
    it {should be_valid}
    its(:name) {should == 'A Title'}
    its(:slug) {should == 'a-title'}
  end
end

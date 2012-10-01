require 'spec_helper'

describe Service do
  it {should validate_presence_of(:title)}
  it {should validate_uniqueness_of(:title).case_insensitive}
  it {should validate_presence_of(:description)}
  it {should have_many(:pictures)}
  
  describe "#slug" do
    subject { Factory.build(:service, :title => 'A Title') }
    it {should be_valid}
    its(:title) {should == 'A Title'}
    its(:slug) {should == 'a-title'}
  end
end

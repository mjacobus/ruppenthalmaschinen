require 'spec_helper'

describe Service do
  describe "Validation" do
    describe "#title" do
      describe "should be present" do
        subject { Factory.build(:service, :title => nil) }
        it {should_not be_valid}
        it {should have(1).errors_on(:title)}  
      end
      
      describe "should be unique" do
        subject {Factory.build(:service, :title => Factory(:service).title.upcase)}
        it {should_not be_valid}
        it {should have(1).errors_on(:title)}
      end
    end
    
    describe "#slug" do
      subject { Factory.build(:service, :title => 'A Title') }
      it {should be_valid}
      its(:title) {should == 'A Title'}
      its(:slug) {should == 'a-title'}
    end
    
    describe "#description" do
      subject { Factory.build(:service, :description => nil) }
      it {should_not be_valid}
      it {should have(1).errors_on(:description)}
    end
  end
end

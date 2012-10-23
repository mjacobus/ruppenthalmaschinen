require 'spec_helper'

describe Service do
  it {should validate_presence_of(:title)}
  it {should validate_uniqueness_of(:title).case_insensitive}
  it {should validate_presence_of(:description)}
  it {should have_many(:pictures)}
  
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:slug) }
  it { should allow_mass_assignment_of(:enabled) }
  it { should allow_mass_assignment_of(:home) }
  
  describe "#slug" do
    subject { Factory.build(:service, :title => 'A Title') }
    it {should be_valid}
    its(:title) {should == 'A Title'}
    its(:slug) {should == 'a-title'}
  end
  
  describe ".enabled" do
    before do
      @enabled = [Factory.create(:service),Factory.create(:service)]
      Factory.create(:service, :enabled => false)
    end
    
    it "should get only enabled services" do
      Service.enabled.should =~ @enabled
    end
  end
  
  describe ".enabled" do
    before do
      @expected = [Factory.create(:service, :home => true)]
      Factory.create(:service, :home => false)
    end
    
    it "should get only enabled services" do
      Service.on_home_page.should =~ @expected
    end
  end
end

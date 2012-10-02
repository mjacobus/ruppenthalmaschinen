require 'spec_helper'

describe Product do
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name).case_insensitive}
  it {should validate_presence_of(:application)}
  it {should belong_to(:type).class_name(ProductType)}
  it {should have_many(:pictures)}
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:application) }
  it { should allow_mass_assignment_of(:slug) }
  it { should allow_mass_assignment_of(:enabled) }
  it { should allow_mass_assignment_of(:type_id) }
  
  
  describe "#slug" do
    subject { Factory.build(:product, :name => 'A Title') }
    it {should be_valid}
    its(:name) {should == 'A Title'}
    its(:slug) {should == 'a-title'}
  end
  
  describe ".enabled" do
    before do
      @enabled = [Factory.create(:product, :enabled => true),
                  Factory.create(:product, :enabled => true)]
      Factory.create(:product, :enabled => false)
    end
    
    it "should only get enabled products" do
      Product.enabled.should =~ @enabled
    end
  end
end

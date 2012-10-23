require 'spec_helper'

describe Product do
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name).case_insensitive}
  it {should validate_presence_of(:application)}
  it {should belong_to(:type).class_name(ProductType)}
  it {should belong_to(:category)}
  it {should have_many(:pictures)}
  it {should have_many(:features)}
  
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:home) }
  it { should allow_mass_assignment_of(:application) }
  it { should allow_mass_assignment_of(:slug) }
  it { should allow_mass_assignment_of(:enabled) }
  it { should allow_mass_assignment_of(:type_id) }
  it { should allow_mass_assignment_of(:category_id) }
  
  
  describe "#slug" do
    subject { Factory.build(:product, :name => 'A Title') }
    it {should be_valid}
    its(:name) {should == 'A Title'}
    its(:slug) {should == 'a-title'}
  end
  
  describe ".enabled" do
    before do
      @expected = [Factory.create(:product, :enabled => true),
                  Factory.create(:product, :enabled => true)]
      Factory.create(:product, :enabled => false)
    end
    
    it "should only get enabled products" do
      Product.enabled.should =~ @expected
    end
  end
  
  describe ".on_home_page" do
    before do
      @expected = [Factory.create(:product, :home => true),
                  Factory.create(:product, :home => true)]
      Factory.create(:product, :home => false)
    end
    
    it "should only get enabled products" do
      Product.on_home_page.should =~ @expected
    end
  end
end

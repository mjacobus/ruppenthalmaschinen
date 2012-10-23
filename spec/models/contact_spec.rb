require 'spec_helper'

describe Contact do
  
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:message) }
  
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:message) }
  it { should allow_mass_assignment_of(:subject) }
  it { should allow_mass_assignment_of(:read) }

  describe "#email" do
    before { @contact = Factory.build(:contact) }
    
    it "should accept valid email" do
      @contact.email = 'test@gmail.com'
      @contact.should be_valid
    end
    
    it "should not accept invalid email format" do
      @contact.email = 'blah.com'
      @contact.should_not be_valid
      @contact.should have(1).errors_on(:email)
    end
    
    #it "should validate mx format" do
    #  @contact.email = 'test@notexisingemail13413241234adsfadsf.com'
    #  @contact.should_not be_valid
    #  @contact.should have(1).errors_on(:email)
    #end
    
  end
end

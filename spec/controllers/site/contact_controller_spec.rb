require 'spec_helper'

describe Site::ContactController, "#new" do
  before { get :new }
  
  it { should respond_with(:success) }
  it { should assign_to(:contact) }
end

describe Site::ContactController, "create" do
  
  context "with valid data" do
    before do
      Contact.delete_all
      put :create, {:contact => Factory.attributes_for(:contact) }
    end
    
    it { should assign_to(:contact) }
    it { should set_the_flash }
    it { should redirect_to(contacts_path)}
    
    it "should create record" do
      Contact.count.should eq(1)  
    end
    
    it "should send an email"
     
  end
  
  context "with invalid data" do
    before { post :create,{} }
    
    it { should respond_with(:success) }
    it { should render_template(:new) }
    
    it "shoud show errors" do
      assigns(:contact).errors.should_not be_empty
    end
    
    it "should not send an email"
  end
  
end

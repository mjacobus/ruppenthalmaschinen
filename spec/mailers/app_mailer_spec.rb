require "spec_helper"

describe AppMailer do
  describe "#contact" do
    subject do
      contact = Contact.new(
        :name    => 'Zezinho Sobrenome',  :email   => 'Zezinho@example.com',
        :subject => 'A Subject',          :message => 'A message. Very short.'
      )
      AppMailer.contact_email(contact)
    end
    
    it "should send email" do
      subject.deliver
      ActionMailer::Base.deliveries.should_not be_empty
    end
    
    its(:reply_to) { should eq(['Zezinho@example.com']) }
    its(:to)      { should eq(['contato@ruppenthalmaschinen.com.br']) }
    its(:from)    { should eq(['Zezinho@example.com']) }
    its(:subject) { should eq('A Subject') }
    its(:encoded) { should  match(Regexp.new("Zezinho Sobrenome")) }
    its(:encoded) { should  match(Regexp.new("Zezinho@example.com")) }
    its(:encoded) { should match(Regexp.new("A message. Very short.")) }
    
  end
end

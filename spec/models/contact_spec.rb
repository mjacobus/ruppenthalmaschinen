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
  
end

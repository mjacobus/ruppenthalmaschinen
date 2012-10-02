require 'spec_helper'

describe Picture do
  it { should validate_attachment_presence(:file) }
  it { should validate_attachment_content_type(:file).
                allowing('image/png', 'image/jpeg').
                rejecting('image/gif') }
  it { should validate_attachment_size(:file).
                less_than(5.megabytes) }
  
  it { should allow_mass_assignment_of(:file) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:sequence) }
end

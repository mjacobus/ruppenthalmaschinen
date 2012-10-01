require 'spec_helper'

describe Picture do
  it { should validate_attachment_presence(:file) }
  it { should validate_attachment_content_type(:file).
                allowing('image/png', 'image/jpeg').
                rejecting('image/gif') }
  it { should validate_attachment_size(:file).
                less_than(5.megabytes) }
end

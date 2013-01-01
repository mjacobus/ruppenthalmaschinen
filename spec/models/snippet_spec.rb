require 'spec_helper'

describe Snippet do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:slug) }
  it { should validate_presence_of(:content) }

  it { should validate_uniqueness_of(:slug).case_insensitive }
end

require 'spec_helper'

describe ProductType do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).case_insensitive }
  it { should validate_presence_of(:sequence) }
  it { should validate_numericality_of(:sequence).only_integer }
end

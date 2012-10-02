require 'spec_helper'

describe Site::StaticController, "#static" do
  subject { response }
  before { get :index, :page => 'sobre-a-empresa' }
  its(:status) { should == 200 }
  it { should render_template('sobre-a-empresa') }
end

require 'spec_helper'

describe Iteration do
  let(:iteration) { create(:iteration) }
  describe 'イテレーションが生成出来る' do
    subject { iteration }
    it { should be_instance_of Iteration }
  end

  describe 'relations' do
    it { should have_many :tasks }
  end
end

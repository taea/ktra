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

  describe '#total_point' do
    subject { iteration.total_point }
    let(:tasks) { [create(:task), create(:task)] }
    before do
      iteration.tasks = tasks
    end
    it '合計値が算出できること' do
      should eq tasks.size
    end
  end
end

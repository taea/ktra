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
    context 'タスクが存在する場合' do
      let(:tasks) { [create(:task), create(:task)] }
      before do
        iteration.tasks = tasks
      end
      it '合計値が算出できること' do
        should eq tasks.size
      end
    end

    context 'タスクが存在しない場合' do
      it '合計値が算出できること' do
        should eq 0
      end
    end
  end
end

require 'spec_helper'

describe Iteration do
  let(:iteration) { create(:iteration) }
  describe 'イテレーションが生成出来る' do
    subject { iteration }
    it { expect(subject).to be_instance_of Iteration }
  end

  describe 'relations' do
    it { should have_many :tasks }
  end

  describe '#total_point' do
    let(:current_user) { create(:user) }
    subject { iteration.total_point(current_user) }
    context 'タスクが存在する場合' do
      let(:tasks) {
        [
          create(:task, point: 2, user_id: current_user.id, iteration_id: iteration.id), 
          create(:task, point: 5, user_id: current_user.id, iteration_id: iteration.id)
        ] 
      }
      let(:total_point) { tasks.sum(&:point) }

      before do
        iteration.tasks = tasks
      end

      it '合計値が算出できること' do
        expect(subject).to eq total_point
      end

      context '他人のタスクが存在する場合' do
        let!(:other) { create(:user) }
        let!(:others_tasks) {
          [
            create(:task, point: 3, user_id: other.id, iteration_id: iteration.id), 
            create(:task, point: 8, user_id: other.id, iteration_id: iteration.id)
          ] 
        }

        it '他人のタスクが混ざらないこと' do
          expect(subject).to eq total_point
        end
      end
    end

    context 'タスクが存在しない場合' do
      let(:total_point) { 0 }
      it '合計値が算出できること' do
        expect(subject).to eq total_point
      end
    end
  end
end

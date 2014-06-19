require 'spec_helper'

describe Task do
  let(:task) { create(:task) }
  describe 'タスクが生成出来る' do
    subject { task }
    it { expect(subject).to be_instance_of Task }
  end

  describe '.owned_by' do
    subject { Task.owned_by(current_user) }
    let(:current_user) { create(:user) }

    context 'タスクが存在しない場合' do
      let(:tasks) { [] }
      it '空の配列を取得すること' do
        expect(subject).to eq tasks
      end
    end

    context 'タスクが存在する場合' do
      let(:task1) { create(:task, point: 2, user_id: current_user.id) }
      let(:task2) { create(:task, point: 5, user_id: current_user.id) }

      context '引数にユーザを指定した場合' do
        it 'そのユーザのタスクが取得できること' do
          expect(subject).to include(task1, task2)
        end

        context '他人のタスクが存在する場合' do
          let(:other) { create(:user) }
          let(:other_task1) { create(:task, point: 3, user_id: other.id) }
          let(:other_task2) { create(:task, point: 8, user_id: other.id) }

          it '他人のタスクが混ざらないこと' do
            expect(subject).to_not include(other_task1, other_task2)
          end
        end
      end

      context '引数にユーザを指定しない場合' do
        let(:current_user) { nil }
        let(:tasks) { [] }
        let!(:other) { create(:user) }
        let!(:others_tasks) {
          [
            create(:task, point: 3, user_id: other.id), 
            create(:task, point: 8, user_id: other.id)
          ] 
        }

        it '空の配列を取得すること' do
          expect(subject).to eq tasks
        end
      end
    end
  end

  describe '#set_default_status' do
    let(:task) { create :task, status: nil }
    it 'should set default status before create' do
      expect(task.status).to eq('unstarted')
    end
  end
end

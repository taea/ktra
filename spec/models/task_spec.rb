require 'spec_helper'

describe Task do
  let(:task) { create(:task) }
  describe 'タスクが生成出来る' do
    subject { task }
    it { expect(subject).to be_instance_of Task }
  end

  describe '.owned_by' do
    context 'ユーザーを指定しない場合' do
      subject { Task.owned_by }

      it 'Exceptionが発生すること' do
        expect{subject}.to raise_error
      end
    end

    context 'ユーザーを指定した場合' do
      let(:current_user) { create(:user) }
      subject { Task.owned_by(current_user) }

      context 'タスクが存在しない場合' do
        let(:tasks) { [] }
        it '空の配列を取得すること' do
          expect(subject).to eq tasks
        end
      end

      context 'タスクが存在する場合' do
        let(:tasks) {
          [
            create(:task, point: 2, user_id: current_user.id), 
            create(:task, point: 5, user_id: current_user.id)
          ] 
        }

        it '自分のタスクが取得できること' do
          expect(subject).to eq tasks
        end

        context '他人のタスクが存在する場合' do
          let!(:other) { create(:user) }
          let!(:others_tasks) {
            [
              create(:task, point: 3, user_id: other.id), 
              create(:task, point: 8, user_id: other.id)
            ] 
          }

          it '他人のタスクが混ざらないこと' do
            expect(subject).to eq tasks
          end
        end
      end
    end
  end
end

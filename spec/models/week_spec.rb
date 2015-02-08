require 'rails_helper'

describe Week do
  let(:week) { create(:week) }
  describe 'イテレーションが生成出来る' do
    subject { week }
    it { expect(subject).to be_instance_of Week }
  end

  describe 'relations' do
    it { should have_many :tasks }
  end

  describe '.since_first_task_by' do
    let!(:past_weeks) { [Week.current(1.week.ago), Week.current(2.week.ago), Week.current(3.week.ago)]}
    let!(:current_week) { Week.current }
    let(:current_user) { create(:user) }
    subject { Week.since_first_task_by(current_user) }

    context 'タスクが存在しない場合' do
      it { expect(subject).not_to be_include current_week }
      it { expect(subject).not_to be_include past_weeks[0] }
      it { expect(subject).not_to be_include past_weeks[1] }
      it { expect(subject).not_to be_include past_weeks[2] }
    end

    context '2週間前のタスクが存在する場合' do
      let!(:task) { create(:task, user: current_user, created_at: 2.week.ago) }
      it { expect(subject).to be_include current_week }
      it { expect(subject).to be_include past_weeks[0] }
      it { expect(subject).to be_include past_weeks[1] }
      it { expect(subject).not_to be_include past_weeks[2] }
    end
  end

  describe '#total_point' do
    let(:current_user) { create(:user) }
    subject { week.total_point(current_user) }
    context 'タスクが存在する場合' do
      let(:tasks) {
        [
          create(:task, point: 2, user_id: current_user.id, week_id: week.id),
          create(:task, point: 5, user_id: current_user.id, week_id: week.id)
        ]
      }
      let(:total_point) { tasks.sum(&:point) }

      before do
        week.tasks = tasks
      end

      it '合計値が算出できること' do
        expect(subject).to eq total_point
      end

      context '他人のタスクが存在する場合' do
        let!(:other) { create(:user) }
        let!(:others_tasks) {
          [
            create(:task, point: 3, user_id: other.id, week_id: week.id),
            create(:task, point: 8, user_id: other.id, week_id: week.id)
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

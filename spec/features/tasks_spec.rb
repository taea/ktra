require 'spec_helper'

feature 'Tasks List Spec' do
  let(:user) { create :user }

  before do
    oauth_sign_in(user, :twitter, false)
  end

  scenario 'Display Task Form after Sign in' do
    expect(page).to have_text('There\'s no tasks yet')
  end

  context 'with tasks' do
    context "with \'unstarted\' task" do
      let!(:task) { create :task, status: :unstarted }

      scenario 'should have \'START\' button' do
        visit '/'
        expect(page).to have_text('START')
      end
    end

    context "with \'doing\' task" do
      let!(:task) { create :task, status: :doing }

      scenario 'should have \'DONE\' button' do
        visit '/'
        expect(page).to have_text('DONE')
      end
    end

    context "with \'done\' task" do
      let!(:task) { create :task, status: :done, title: 'DONED TASK' }

      scenario 'DONE task should not displayed at root' do
        visit '/'
        expect(page).to_not have_text('DONED TASK')
      end
    end
  end
end

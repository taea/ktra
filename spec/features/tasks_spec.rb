require 'rails_helper'

feature 'Tasks List Spec' do
  let(:user) { create :user }

  background do
    oauth_sign_in(user, :twitter, false)
  end

  scenario 'Display Task Form after Sign in' do
    expect(page).to have_text('There\'s no tasks yet')
  end

  context 'with tasks' do
    let!(:task) { create :task }

    context "with \'unstarted\' task ( default status )" do
      scenario 'should have \'START\' button' do
        visit '/'
        expect(page).to have_text('START')
      end
    end

    context "with \'doing\' task" do
      background do
        task.status = 'doing'
        task.save
      end

      scenario 'should have \'DONE\' button' do
        visit '/'
        expect(page).to have_text('DONE')
      end
    end

    context "with \'done\' task" do
      background do
        task.title = 'DONED TASK'
        task.status = 'done'
        task.save
      end

      scenario 'DONE task should not displayed at root' do
        visit '/'
        expect(page).to_not have_text('DONED TASK')
      end
    end
  end
end

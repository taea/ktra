require 'spec_helper'

describe 'Tasks' do
  let(:user) { create(:user) }

  describe 'Taskを登録' do
    before do
      sign_in(user)
      visit root_path
    end
    context '何も入力しない場合' do
      before do
        within('form#new_task') do
          find('button[type=submit]').click()
        end
      end

      it 'エラーとなること' do
        # FIXME: エラー文言出して、その文言を見た方がよい
        expect(page).to have_css('#error_explanation')
      end
    end

    context '何か入力した場合' do
      let(:new_task) { build(:task) }
      before do
        within('form#new_task') do
          find('#task_title').set(new_task.title)
          find('button[type=submit]').click()
        end
      end
      it '登録されること' do
        within('.tasks-list') do
          expect(page).to have_content(new_task.title)
        end
      end
    end
  end
end

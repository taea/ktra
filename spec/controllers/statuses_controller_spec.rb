require "spec_helper"

describe StatusesController do
  let(:user) { create(:user) }
  let(:task) { create :task, user_id: user.id }

  before do
    sign_in user
  end

  context 'with {format: :js}' do
    describe 'PUT #update' do
      let(:task_param) do
        {
          status: 'start',
          week_id: 1
        }
      end

      it 'js is works' do
        put :update, task_id: task.id, task: task_param, format: :js
        expect(response).to be_success
      end
    end
  end
end

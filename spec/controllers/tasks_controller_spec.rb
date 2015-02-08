require 'rails_helper'

describe TasksController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  let(:task) { create :task, user_id: user.id }
  let(:task_params) { attributes_for :task, user_id: user.id }

  context 'with {format: :html}' do
    describe 'GET #edit' do
      it 'redirect_to root_url' do
        get :edit, id: task.id
        expect(response).to redirect_to root_url
      end
    end
  end

  context 'with {format: :json}' do
    describe 'GET #index' do
      it 'json is works' do
        get :index, {format: :json}
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      it 'json is works' do
        post :create, task: task_params, format: :json
        expect(response).to be_success
      end
    end

    describe 'GET #show' do
      it 'json is works' do
        get :show, id: task.id, format: :json
        expect(response).to be_success
      end
    end

    describe 'PUT #update' do
      it 'json is works' do
        put :update, id: task.id, task: task_params, format: :json
        expect(response).to be_success
      end
    end

    describe 'DELETE #destoy' do
      it 'json is works' do
        delete :destroy, id: task.id, format: :json
        expect(response).to be_success
      end
    end
  end

  context 'with {format: :js}' do
    describe 'POST #create' do
      it 'js is works' do
        post :create, task: task_params, format: :js
        expect(response).to be_success
      end
    end

    describe 'GET #edit' do
      it 'js is works' do
        get :edit, id: task.id, format: :js
        expect(response).to be_success
      end
    end

    describe 'PUT #update' do
      it 'js is works' do
        put :update, id: task.id, task: task_params, format: :js
        expect(response).to be_success
      end
    end

    describe 'DELETE #destoy' do
      it 'js is works' do
        delete :destroy, id: task.id, format: :js
        expect(response).to be_success
      end
    end
  end
end

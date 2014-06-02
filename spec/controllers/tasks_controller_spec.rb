require "spec_helper"

describe TasksController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  let(:task) { create :task, user_id: user.id }

  context 'with {format: :json}' do
    describe 'GET #index' do
      it 'json is works' do
        get :index, {format: :json}
        expect(response).to be_success
      end
    end

    describe 'POST #create' do
      it 'json is works' do
        post :create, task: attributes_for(:task, user_id: user.id), format: :json
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
        put :update, id: task.id, task: attributes_for(:task, user_id: user.id), format: :json
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
        post :create, task: attributes_for(:task, user_id: user.id), format: :js
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
        put :update, id: task.id, task: attributes_for(:task, user_id: user.id), format: :js
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

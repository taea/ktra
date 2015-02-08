require 'rails_helper'

describe WeeksController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  context 'with {format: :json}' do
    describe 'GET #index' do
      it 'json is works' do
        get :index, {format: :json}
        expect(response).to be_success
      end
    end

    let(:week) { create :week }

    describe 'GET #show' do
      it 'json is works' do
        get :show, id: week.id, format: :json
        expect(response).to be_success
      end
    end
  end
end


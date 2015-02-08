require 'rails_helper'

describe AccountsController do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe 'GET #show' do
    it 'json is works' do
      get :show, format: :json
      expect(response).to be_success
    end
  end

  describe 'hoge' do
    it { expect(user).to be_valid }
  end
end

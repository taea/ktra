require 'rails_helper'

describe 'sign_in' do
  let(:new_user) { build(:user) }

  describe 'twitter ログイン' do
    before do
      oauth_sign_in(new_user, :twitter, false)
    end
    it 'ログインしたユーザー名が表示される' do
      within('.header .user .name') do
        expect(page).to have_content new_user.nickname
      end
    end
  end
end

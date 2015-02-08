require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  let(:valid_auth_hash) {
    {
      'provider' => 'twitter',
      'uid' => '123456',
      'info' => {
        'nickname' => 'ken_c_lo',
        'name' => 'いぬです',
        'image' => 'https://a0.twimg.com/profile_images/2900491556/9d2bf873770958647f18b8e61af31f1a_bigger.png'
      },
      'credentials' => {
        'token' => '123445678-AbeafjabutWjfav932m38e3TTabbbbbk',
        'secret' => 'UzOc15tGx8AMYLOX5dcZ2UQTEwe6LiVysdoyhiKlaw'
      }
    }
  }

  describe 'ユーザーが生成出来る' do
    subject { user }
    it { expect(subject).to be_instance_of User }
  end

  describe '.authentication' do
    let(:auth_hash) { nil }
    let(:current_user) { nil }
    subject { User.authentication(auth_hash, current_user) }

    context 'auth_hashがない' do
      it { expect(subject).to be_nil }
    end

    context 'auth_hashがある' do
      let(:auth_hash) { valid_auth_hash }
       context 'userが居る' do
        before do
          user.uid = auth_hash['uid']
          user.save
          user.reload
        end
        it { expect(subject).to eq user }
        it { expect(subject).to be_instance_of User }
      end

      context 'userがいない' do
        let(:new_user) { create(:user) }
        before do
          allow(User).to receive_message_chain(:where, :first_or_initialize).and_return(new_user)
        end
        it { expect(subject).to eq new_user }
        it { expect(subject).to be_instance_of User }
      end
      it { expect(subject.image).to match '_bigger' }
    end
  end
end

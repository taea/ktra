require 'spec_helper'

describe User do
  let(:user) { create(:user) }
  let(:valid_auth_hash) {
    {
      'provider' => 'twitter',
      'uid' => '123456',
      'info' => {
        'nickname' => 'ppworks',
        'name' => 'PP works',
        'image' => 'http://a0.twimg.com/profile_images/2900491556/9d2bf873770958647f18b8e61af31f1a_normal.png'
      },
      'credentials' => {
        'token' => '123445678-AbeafjabutWjfav932m38e3TTabbbbbk',
        'secret' => 'UzOc15tGx8AMYLOX5dcZ2UQTEwe6LiVysdoyhiKlaw'
      }
    }
  }

  describe 'ユーザーが生成出来る' do
    subject { user }
    it { should be_instance_of User }
  end

  describe '.authentication' do
    let(:auth_hash) { nil }
    let(:current_user) { nil }
    subject { User.authentication(auth_hash, current_user) }

    context 'auth_hashがない' do
      it { should be_nil }
    end

    context 'auth_hashがある' do
      let(:auth_hash) { valid_auth_hash }
       context 'userが居る' do
        before do
          user.uid = auth_hash['uid']
          user.save
          user.reload
        end
        it { should eq user }
        it { should be_instance_of User }
      end

      context 'userがいない' do
        let(:new_user) { create(:user) }
        before do
          User.stub_chain(:where, :first_or_initialize).and_return(new_user)
        end
        it { should eq new_user }
        it { should be_instance_of User }
      end
      it { expect(subject.image).to match '_bigger' }
    end
  end
end

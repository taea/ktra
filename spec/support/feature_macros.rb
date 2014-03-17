include Warden::Test::Helpers
module FeatureMacros
  extend ActiveSupport::Concern

  included do
    let(:auth_hash) {
      {
        'provider' => 'twitter',
        'uid' => '12345',
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
    after do
      Warden.test_reset!
    end
  end

  def oauth_sign_in user, provider, force_reload = true
    back_path = page.current_path
    auth =
    {
      'uid' => user.uid,
      'info' => {
        'name' => user.name,
        'nickname' => user.nickname,
        'image' => user.image,
        'email' => '',
      },
      'credentials' => {
        'token' => 'token',
        'secret' => 'secret'
      },
      'extra' => {
        'raw_info' => {
          'avatar_url' => user.image
        }
      }
    }
    auth[:provider] = provider
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[provider.to_sym] = OmniAuth::AuthHash.new(auth)
    visit user_omniauth_authorize_path(provider: provider.to_s)
    visit back_path if back_path
    reload if force_reload
  end

  def sign_in(user)
    Warden.test_mode!
    user.confirm! if user.respond_to?(:confirm!)
    scope = user.class.to_s.downcase.to_sym
    login_as(user, scope: scope, run_callbacks: false)
  end

  def sign_out(user = nil)
    if user
      scope = user.class.to_s.downcase.to_sym
      logout(scope)
    else
      logout
    end
  end

  def reload
    visit page.current_path if page.current_path
  end

  def wait_for_ajax
    Timeout.timeout(10) do
      loop do
        active = page.evaluate_script('jQuery.active')
        break if active == 0
      end
    end
  end
end

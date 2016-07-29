module OmniAuthTestHelper
  def valid_facebook_login_setup
    if Rails.env.test?
      test_users = Koala::Facebook::TestUsers.new(app_id:
      '1705011599760572', secret: '732386bd8494d6057e2b04ad24b02cc5')
      user = test_users.create(true)
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new({
        provider: 'facebook',
        uid: '123545',
        info: {
          first_name: 'Gaius',
          last_name: 'Baltar',
          email: 'test@example.com'
        },
        credentials: {
          token: user['access_token'],
          expires_at: Time.now + 1.week
        },
        extra: {
          raw_info: {
            gender: 'male'
          }
        }
      })
    end
  end
end

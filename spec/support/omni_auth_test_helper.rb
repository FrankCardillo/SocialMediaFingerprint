module OmniAuthTestHelper
  def valid_facebook_login_setup
    if Rails.env.test?
      test_users = Koala::Facebook::TestUsers.new(app_id: ENV['FACEBOOK_APP_ID'], secret: ENV['FACEBOOK_APP_SECRET'])
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

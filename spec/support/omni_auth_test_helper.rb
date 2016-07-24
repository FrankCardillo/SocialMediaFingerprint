module OmniAuthTestHelper
  def valid_facebook_login_setup
    if Rails.env.test?
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
          token: "EAAYNmIysLzABAJvckBS2PGUfXsvqaK3nQ07boWOQkDJDMiQqGeWlSpjsZA2MBMgZClo61pZCIBCTJtvQw1jmHTd9WHQxlgqDzw5lKWtNclmhn7emzlCin01ZBLy9xM7a3EN9IRxZAehQhCoqKTYCyJB8U8E8uDncGXcrOuoOHGQZDZD",
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

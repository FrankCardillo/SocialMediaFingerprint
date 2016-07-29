FactoryGirl.define do
  test_users = Koala::Facebook::TestUsers.new(app_id:
  '1705011599760572', secret: '732386bd8494d6057e2b04ad24b02cc5')
  generate_access_token = test_users.create(true)

  factory :user do
    sequence(:name) { |m| "FRANK#{m}" }
    sequence(:email) { |m| "frank#{m}@gmail.com" }
    sequence(:password) { |m| "password#{m}" }
    access_token generate_access_token['access_token']
    expires_at Time.now + 1.week
  end
end

FactoryGirl.define do
  factory :image do
    sequence(:user_id) { |m| m }
    image_url File.open('spec/support/test.png')
  end
end

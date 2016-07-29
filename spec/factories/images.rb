FactoryGirl.define do
  factory :image do
    sequence(:user_id) { |m| m }
    image_url File.open('spec/support/test.png')
  end
end

# Factory :video_file do
#   file { fixture_file_upload 'test.png', 'image/png' }
#
#   after_create do |video, proxy|
#     proxy.file.close
#   end
# end

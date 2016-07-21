require 'rails_helper'
require 'shoulda-matchers'
require 'valid_attribute'

describe Image do
  it { should allow_value(File.open(File.join(Rails.root, '/spec/support/test.png'))).for(:image_url) }
  it { should_not allow_value(File.open(File.join(Rails.root, '/spec/support/bad_image.jpg'))).for(:image_url) }
  it { should belong_to(:user) }
end

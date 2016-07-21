require 'rails_helper'
require 'shoulda-matchers'
require 'valid_attribute'

describe User do
  it { should have_valid(:name).when('user1', 'user2') }
  it { should_not have_valid(:name).when(nil, '') }
end

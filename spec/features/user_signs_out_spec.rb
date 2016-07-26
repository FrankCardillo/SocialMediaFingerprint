require 'rails_helper'

feature 'saving canvas as image' do
  before(:each) do
    valid_facebook_login_setup
    visit '/users/auth/facebook/callback'
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] =
    OmniAuth.config.mock_auth[:facebook]
  end

  scenario 'user signs out' do
    click_button 'Sign Out'
    expect(page).to have_content('Signed out successfully')
    expect(page).to have_content('Social Media Fingerprint')
  end
end

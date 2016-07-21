require 'rails_helper'

feature 'saving canvas as image' do
  before(:each) do
    valid_facebook_login_setup
    visit '/users/auth/facebook/callback'
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
  end

  scenario 'user navigates to canvas creation page' do
    expect(page).to have_content('Successfully authenticated from Facebook account.')
    click_link 'Create New Fingerprint'
    expect(page).to have_content('Generate Image to Save')
  end

  scenario 'user creates saves canvas, sees it in the gallery', js: true do
    click_link 'Create New Fingerprint'
    click_button 'Generate Image to Save'
    visit images_path
    expect(page).to have_content("Gaius Baltar's Fingerprint")
  end
end

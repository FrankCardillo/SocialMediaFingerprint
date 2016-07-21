require 'rails_helper'

describe "GET '/auth/facebook/callback'" do
  before(:each) do
    valid_facebook_login_setup
    get "/users/auth/facebook/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "sets the user_id" do
    expect(session["warden.user.user.key"][0][0]).to eq(User.last.id)
  end

  it "redirects to authenticated_root" do
    expect(response).to redirect_to 'http://www.example.com/images'
  end
end

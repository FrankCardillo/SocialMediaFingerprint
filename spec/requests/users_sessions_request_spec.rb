require 'rails_helper'

describe "GET '/auth/facebook/callback'" do
  before(:each) do
    valid_facebook_login_setup
    get "/users/auth/facebook/callback"
    request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
  end

  it "should set user_id" do
    expect(session["warden.user.user.key"][0][0]).to eq(User.last.id)
  end

  it "should redirect to root" do
    expect(response).to redirect_to 'http://www.example.com/tests'
  end
end

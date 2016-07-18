class AuthenticateController < ApplicationController
  before_filter :auth_user

  def auth_user
    redirect_to root_path unless user_signed_in?
  end
end

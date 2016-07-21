class FacebookApi

  def initialize(user_token)
    graph(user_token)
  end

  def get_friends
    fb_graph.get_connections("me", "friends")
  end

  private

  def graph(user_token)
    @fb_graph ||= Koala::Facebook::API.new(user_token, ENV["SECRET"])
  end
end

FacebookApi.new(current_user.access_token)

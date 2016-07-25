class FacebookApi
  attr_reader :data

  def initialize(user_token)
    @data = graph(user_token).get_object('me?fields=first_name,email,last_name,
    age_range,link,gender,locale,timezone,updated_time,verified')
  end

  private

  def graph(user_token)
    @fb_graph ||= Koala::Facebook::API.new(
      user_token, ENV['FACEBOOK_APP_SECRET']
    )
  end
end

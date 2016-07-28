class FacebookApi
  attr_reader :data

  def initialize(user_token, app_secret)
    @data = graph(user_token, app_secret).get_object('me?fields=first_name,id,last_name,
    age_range,link,gender,locale,timezone,updated_time,verified')
  end

  private

  def graph(user_token, app_secret)
    data_hash ||= Koala::Facebook::API.new(
      user_token, app_secret
    )
  end
end

track_keywords = ENV['TWITTER_TRACK_KEYWORDS']

options = {
  path:   '/1/statuses/filter.json',
  params: { track: track_keywords },
  oauth:  {
    consumer_key:    ENV['TWITTER_KEY'],
    consumer_secret: ENV['TWITTER_SECRET'],
    token:           ENV['TWITTER_OAUTH_TOKEN'],
    token_secret:    ENV['TWITTER_OAUTH_SECRET']
  }
}

EM.run do
  twitter_client = EM::Twitter::Client.connect(options)

  twitter_client.each do |result|
    result = JSON.parse(result)
    Task.register_from_twitter(result)
  end
end

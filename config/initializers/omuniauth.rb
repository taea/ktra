Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, Figaro.env.twitter_key, Figaro.env.twitter_secret
end

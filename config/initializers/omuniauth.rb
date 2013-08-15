Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, Figaro.env.twitter.key, Figaro.env.twitter.secret
end

class Task < ActiveRecord::Base
  POINTS = %w(0 1 2 3 5 8)
  attr_accessor :to_twitter

  validates_presence_of :user_id, :title
  belongs_to :user
  scope :active, -> { where(status: ['unstarted', 'doing']).order("status ASC, updated_at DESC") }
  scope :owned_by, -> (user) { where(user_id: user ) }

  after_create :post_to_twitter

  def sync_with_twitter
    Rails.cache.fetch("Task#sync_with_twitter", expires_in: 15.minutes) do
      return unless self.tweet_id
      tweet = twitter_client.status(self.tweet_id)
      self.update_column(:tweet_meta_data, tweet.to_json)
    end
  rescue e => Twitter::Error::NotFound
    self.update_columns(tweet_id: nil, tweet_meta_data: nil)
  rescue
  end

  def retweeted_count
    return unless self.tweet_meta_data
    tweet['retweet_count'].to_i
  end

  def favorited_count
    return unless self.tweet_meta_data
    tweet['favorite_count'].to_i
  end

  def tweet
    data = {'retweet_count' => 0, 'favorite_count' => 0}
    data.merge(JSON.parse(self.tweet_meta_data))
  end

  private
  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = self.user.token
      config.access_token_secret = self.user.secret
    end
  end

  def post_to_twitter
    return true unless self.to_twitter == '1'
    response = twitter_client.update(I18n.t('models.task.post_to_twitter',
                    title: self.title,
                    point: self.point))
    self.update_column(:tweet_id, response.id)
  rescue
  end
end

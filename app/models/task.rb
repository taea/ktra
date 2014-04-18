class Task < ActiveRecord::Base
  POINTS = %w(0 1 2 3 5 8)
  attr_accessor :to_twitter

  validates_presence_of :user_id, :title
  belongs_to :user
  scope :active, -> { where(status: ['unstarted', 'doing']).order("status ASC, updated_at DESC") }
  scope :owned_by, -> (user) { where(user_id: user ) }

  after_create :post_to_twitter

  private
  def post_to_twitter
    return true unless self.to_twitter == '1'
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_KEY']
      config.consumer_secret     = ENV['TWITTER_SECRET']
      config.access_token        = self.user.token
      config.access_token_secret = self.user.secret
    end

    client.update(I18n.t('models.task.post_to_twitter',
                    title: self.title,
                    point: self.point))
  end
end

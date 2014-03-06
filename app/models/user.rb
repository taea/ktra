class User < ActiveRecord::Base
  attr_accessible :image, :name, :nickname, :secret, :token, :uid
  has_many :tasks, dependent: :destroy

  validates_presence_of :uid
  validates_uniqueness_of :uid

  def self.find_or_create_by_oauth(auth, current_user)
    if user = User.find_by_oauth(auth)
      user
    else
      User.create_by_oauth(auth)
    end
  end

  def self.find_by_oauth(auth)
    user = User.find_by_uid(auth['uid'])
    if user
      user
    else
      nil
    end
  end

  def self.create_by_oauth(auth)
    user = User.new
    user.uid = auth['uid']
    user.name = auth.info['name']
    user.nickname = auth.info['nickname']
    user.image = auth.info['image']
    user.token = auth.credentials['token']
    user.secret = auth.credentials['secret']
    user.save
    user
  end
end

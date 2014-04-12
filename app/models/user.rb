class User < ActiveRecord::Base
  devise :omniauthable
  #attr_accessible :image, :name, :nickname, :secret, :token, :uid
  has_many :tasks, dependent: :destroy

  validates_presence_of :uid
  validates_uniqueness_of :uid

  def self.authentication(auth, current_user)
    begin
      params = {
        uid: auth['uid'],
        name: auth['info']['name'],
        nickname: auth['info']['nickname'],
        image: auth['info']['image'],
        token: auth['credentials']['token'],
        secret: auth['credentials']['secret'],
      }
    rescue => e
      return nil
    end

    user = User.where(uid: params[:uid]).first_or_initialize
    user.attributes = params
    user.save
    user
  end
end

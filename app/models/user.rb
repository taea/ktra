class User < ActiveRecord::Base
  attr_accessible :image, :name, :nickname, :secret, :token, :uid
  def self.find_or_create_from_auth_hash(auth)
    user = User.new
    user.uid = auth['uid']
  end
end

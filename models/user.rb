class User

  require 'date'

  include Mongoid::Document

  field :uid, type: Integer
  field :name, type: String
  field :nickname, type: String
  field :token, type: String
  field :secret, type: String
  field :joined, type: Date

  def self.login(auth)
    raise 'Authentication token was nil.' if not auth
    user = User.where(uid: auth["uid"]).first
    user ||= self.add(auth)
  end
  
  def self.add(auth)
    info, creds = auth["info"], 
    auth["credentials"]
    user = User.create(
      uid:      auth["uid"], 
      name:     info["name"],
      nickname: info["nickname"],
      token:    creds["token"],
      secret:   creds["secret"],
      joined:   Date.today
    )
    user.save!; user
  end

end

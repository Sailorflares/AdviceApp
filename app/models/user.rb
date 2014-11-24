class User < ActiveRecord::Base
  has_many :user_advices #votes
  has_many :advices, through: :user_advices #articles through votes

  validates :uid, :uniqueness => {:scope => :provider}

  def self.login_from_omniauth(auth)
    find_from_omniauth(auth) || create_from_omniauth(auth)
  end

  def self.find_from_omniauth(auth)
    find_by(:uid => auth[:uid], :provider => auth[:provider])
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth[:provider]
      user.uid = auth[:uid]
      user.name = auth[:info][:name]
    end
  end
  
end

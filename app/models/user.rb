class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter],
         :authentication_keys => [:email]

  validates :name, :presence => true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email || auth.uid.to_s+'@twitter.com'
      user.username = auth.info.username
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook],
         :authentication_keys => [:rut]

  validates :email,presence: true, uniqueness: {case_sensitive: false}
  validates :rut,presence: true, uniqueness: {case_sensitive: false}


  has_many :posts
  enum role: [:admin, :analyzer, :lawyer, :appraiser, :visit]

  #geocoded_by :address
  #after_validation :geocode

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

end

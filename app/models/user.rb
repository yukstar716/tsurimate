class User < ApplicationRecord
  has_many :posts,                dependent: :destroy
  has_many :post_comments,        dependent: :destroy
  has_many :post_comment_replies, dependent: :destroy
  has_many :likes,                dependent: :destroy
  has_many :like_posts,             through: :likes,  source: :post
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable, :omniauthable, omniauth_providers:[:twitter]

  mount_uploader :image, ImageUploader

  validates :username, presence:   true
  validates :email,    presence:   true,
                       uniqueness: true
  validates :password, presence: true,
                       length: { minimum: 6 }

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.username = auth["info"]["nickname"] #usernameもしくはnickname
      user.email = User.dummy_email(auth) # ダミーのemailを生成
      user.password = Devise.friendly_token[0, 20] # パスワードを自動生成
      user.remote_image_url = auth["info"]["image"]
      user.description = auth["info"]["description"]
      #user_image = auth["info"]["image"]
      #uri = URI.parse(user_image)
      #image = uri.open
      #user.avatar.attach(io: image, filename: "#{user.username}_profile.png")
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  private
  
  def self.dummy_email(auth)
    "#{auth["uid"]}-#{auth["provider"]}@example.com"
  end

end

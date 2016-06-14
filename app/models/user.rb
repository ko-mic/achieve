class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :omniauthable # confirmableとomuniauthableを追加
  has_many :blogs, dependent: :destroy
  
  # サインアップ時Email 重複防止 facebook認証時のemailフィールド設定の実装
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    
    user = User.where(provider: auth.provider, uid: auth.uid).first
    
    unless user
      user = User.new(name: auth.extra.raw_info.name,
                        provider: auth.provider,
                        uid: auth.uid,
                        email: auth.info.email,
                        password: Devise.friendly_token[0,20]
                        )
      user.skip_confirmation!
      user.save
    end
    user
  end

  # Twitter認証時のEmailフィールド設定
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    
    user = User.where(provider: auth.provider, uid: auth.uid).first
    
    unless user
      user = User.new(name: auth.info.nickname,
                        provider: auth.provider,
                        uid: auth.uid,
                        email: User.create_unique_email,
                        password: Devise.friendly_token[0,20]
                        )
      user.skip_confirmation!
      user.save
    end
    user
  end

  # Twitter認証時のemail用にuuidのランダムな文字列を生成する処理を実装する
  def self.create_unique_string
    SecureRandom.uuid
  end
  
  # Twitter認証ではEmailを自動取得できないため、自動的に一意のEmailを作成するアクションと処理を実装する
  def self.create_unique_email
    User.create_unique_string + "@example.com"
  end

end

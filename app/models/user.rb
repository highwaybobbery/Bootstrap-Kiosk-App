class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def password_required?
    super && provider.blank?
  end

  def self.user_properties(user, auth_hash, email, newly_created = false)
    user.provider = auth_hash.provider
    user.uid = auth_hash.uid
    user.email = email
    user.first_name = auth_hash.info.first_name
    user.last_name = auth_hash.info.last_name
    user.ctct_token = auth_hash.credentials.token
    user.encrypted_password = ''
  end

  def self.from_omniauth(auth_hash)
    email = auth_hash.info.email || auth_hash.info.email_entries[0]
    user = find_by(email: email, provider: nil)

    if user
      user_properties account, auth_hash, email
      user
    else
      user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
      user_properties user, auth_hash, email, true
      user.save
      user
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
     super
    end
  end

end

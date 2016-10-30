class Doctor < ApplicationRecord
  before_save { email.downcase! }
  has_secure_password

  has_many :favorites
  has_many :users, through: :favorites

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.search(search) 
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Doctor.where(['name LIKE ?', "%#{search}%"])
    else
      Doctor.all
    end
  end

end

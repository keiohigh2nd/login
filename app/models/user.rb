class User < ApplicationRecord
  before_save { email.downcase! }

  validates :agreement, :acceptance =>true
  #validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true, length: { is: 5 }

  has_many :notes, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :alerts, dependent: :destroy
  has_many :pushs, dependent: :destroy
  has_secure_password

  has_many :favorites
  has_many :doctors, through: :favorites

  has_one :summary, dependent: :destroy
  has_many :screenings, dependent: :destroy
 
  def check_agreement
    if agreement.present?
      errors.add(:agreement, "can't be in the past")
    end
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.search(search)
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      User.where(['name LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end

end

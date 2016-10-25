class User < ApplicationRecord
  before_save { email.downcase! }

  validates :agreement, :acceptance =>true
  validates :email, presence: true
  validates :name, presence: true
  validates :password, presence: true, length: { is: 4 }

  has_many :notes, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_secure_password

<<<<<<< HEAD
  has_many :favorites
  has_many :doctors, through: :favorites
=======
>>>>>>> 8e8e1ad165ff0211b4502d055cb1561fa0495e4d

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

end

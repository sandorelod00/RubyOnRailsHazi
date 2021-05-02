class User < ApplicationRecord
  has_many :team_member_relations
  attr_accessor :password
  before_save :encrypt_password

  validates :name, presence: true
  validates :email, {presence: true , uniqueness: true }
  validates :password, confirmation: true , if: :password_required?
  validates :phone, presence: false

  def password_required?
    self.new_record? || !self .password.blank?
  end

  def User.encrypt(password, salt)
    Digest::SHA1.hexdigest(password + salt)
  end

  def encrypt_password
    return if self.password.blank?
    if self.new_record?
      self.salt = SecureRandom.base64 16
    end
    self.encrypted_password = User.encrypt(self.password, self.salt)
  end

  def self.authenticate(email, pass)
    user = User.where(email: email).take
    user && user.authenticated?(pass) ? user : nil
  end

  def authenticated?(pass)
    self.encrypted_password == User.encrypt(pass, self.salt)
  end
end

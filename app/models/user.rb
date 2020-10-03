require 'openssl'

class User < ApplicationRecord
  ITERATIONS = 20000
  DIGEST = OpenSSL::Digest::SHA256.new

  has_many :questions

  validates :username, presence: true,               # наличие
                       uniqueness: true,             # уникальность
                       length: { maximum: 40 },      # длина юзернейма max 40 символов
                       format: { with: /\A\w+\Z/ }   # формата юзернейма

  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }  # формат email

  validates :password, presence: true, on: :create

  attr_accessor :password

  validates_confirmation_of :password

  before_save :encrypt_password
  before_validation :downcase_username, :downcase_email

  def downcase_email
    email.downcase!
  end

  def downcase_username
    username.downcase!
  end

  def encrypt_password
    if password.present?
      self.password_salt = User.hash_to_string(OpenSSL::Random.random_bytes(16))

      self.password_hash = User.hash_to_string(
        OpenSSL::PKCS5.pbkdf2_hmac(
          password, password_salt, ITERATIONS, DIGEST.length, DIGEST
        )
      )
    end
  end

  def self.hash_to_string(password_hash)
    password_hash.unpack('H*')[0]
  end

  def self.authenticate(email, password)
    user = find_by(email: email)

    return nil unless user.present?

    hashed_password = User.hash_to_string(
      OpenSSL::PKCS5.pbkdf2_hmac(
        password, user.password_salt, ITERATIONS, DIGEST.length, DIGEST
      )
    )

    return nil unless hashed_password == user.password_hash

    user
  end
end

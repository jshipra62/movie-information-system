class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true
  validates :name, presence: true

  has_many :books,    dependent: :destroy
  has_many :reviews,    dependent: :destroy
end
